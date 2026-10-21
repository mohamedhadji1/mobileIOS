import Flutter
import UIKit
import workmanager_apple
import CoreLocation
import CoreTelephony
import Network
import AVFoundation
import CoreImage
import ImageIO

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  // Significant-location-change monitor. Relaunches the app in the background
  // after a force-quit so workforce location/wifi telemetry keeps flowing —
  // Apple's sanctioned mechanism for continuous compliance tracking.
  private let significantLocationManager = CLLocationManager()

  // Live network-path monitor. iOS exposes no airplane-mode API, so we infer
  // "radios cut / device went dark" from interface availability: airplane mode
  // drops the cellular path (and WiFi too unless the user re-enables it).
  // Runs continuously so the method channel can answer synchronously.
  private let pathMonitor = NWPathMonitor()
  private var cellularAvailable = true

  // Retained CoreTelephony handle + channel so the SIM-change notifier stays
  // alive and can push swap events to Dart between telemetry polls. On iOS 16+
  // carrier identity is dummied out, but this notifier still fires on any SIM
  // change — the swap event is what matters for risk, not the carrier name.
  private let telephonyInfo = CTTelephonyNetworkInfo()
  private var deviceChannel: FlutterMethodChannel?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Arm significant-location-change monitoring. iOS delivers events (and
    // relaunches a terminated app) on ~500m / cell-tower moves. Requires the
    // user to have granted "Always" location; harmless to call before then.
    significantLocationManager.allowsBackgroundLocationUpdates = true
    significantLocationManager.pausesLocationUpdatesAutomatically = false
    significantLocationManager.startMonitoringSignificantLocationChanges()

    // Track cellular-radio availability. availableInterfaces lists every usable
    // interface regardless of the current route, so cellular still shows when
    // the radio is on even while WiFi carries traffic — unlike usesInterfaceType,
    // which only reflects the active route and would false-flag airplane on WiFi.
    // Airplane mode removes the cellular interface entirely.
    pathMonitor.pathUpdateHandler = { [weak self] path in
      self?.cellularAvailable = path.availableInterfaces.contains { $0.type == .cellular }
    }
    pathMonitor.start(queue: DispatchQueue(label: "com.cypurge.pathmonitor"))

    // Register the iOS background task id (must match Info.plist
    // BGTaskSchedulerPermittedIdentifiers + the Dart uniqueName). iOS runs it
    // roughly hourly at the OS's discretion — not a guaranteed interval.
    // ponytail: verify signature against the installed workmanager version if
    // this fails to compile — the iOS BGTask API shifts between minor releases.
    WorkmanagerPlugin.registerBGProcessingTask(withIdentifier: "device-signal-collector-task")
    WorkmanagerPlugin.registerPeriodicTask(
      withIdentifier: "device-signal-collector-task",
      frequency: NSNumber(value: 60 * 60)
    )

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

    // Mirrors the Android "com.cypurge.app/device" channel. Apple exposes no
    // public airplane-mode API, so airplane is inferred from radio availability
    // (NWPathMonitor) corroborated by CoreTelephony hardware presence: a device
    // with cellular hardware (SIM present) whose cellular path is unavailable
    // has its cellular radio off. In airplane mode the cellular path always
    // drops; WiFi may be re-enabled by the user, so we do NOT require WiFi down.
    // False positive: a real no-coverage area looks identical — acceptable, both
    // mean "worker unreachable by cell" for risk. The Dart layer additionally
    // clears this when networkType == 'mobile' (cellular actively carrying data).
    let deviceChannel = FlutterMethodChannel(name: "com.cypurge.app/device",
                                             binaryMessenger: controller.binaryMessenger)
    self.deviceChannel = deviceChannel
    deviceChannel.setMethodCallHandler { [weak self] (call, result) in
      guard let self = self else { result(false); return }
      switch call.method {
      case "isAirplaneModeOn":
        let simPresent = !(self.telephonyInfo
          .serviceSubscriberCellularProviders ?? [:]).isEmpty
        result(simPresent && !self.cellularAvailable)
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    // Native front camera + JPEG encode for the liveness walk (see LivenessCamera).
    LivenessCamera.shared.register(messenger: controller.binaryMessenger)

    // Push SIM changes to Dart the moment they happen so a swap between the
    // 15-min/1-h polls is caught even on WiFi (connectivity never blips then).
    // Dart's onRadioChanged handler re-collects telemetry and diffs sim_state.
    telephonyInfo.serviceSubscriberCellularProvidersDidUpdateNotifier = { [weak self] _ in
      DispatchQueue.main.async {
        self?.deviceChannel?.invokeMethod("onRadioChanged", arguments: nil)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}

/// Front camera for the liveness walk, entirely native: AVFoundation capture ->
/// upright JPEG -> Dart, finished frames only, in capture order. Mirrors
/// LivenessCamera.kt on Android — see there for why the camera plugin's image
/// stream is not used (every raw frame crossed into Dart, capping the rate).
///
/// Lives in this file, not its own, so it compiles without editing the Xcode
/// project.
final class LivenessCamera: NSObject, FlutterStreamHandler,
  AVCaptureVideoDataOutputSampleBufferDelegate
{
  static let shared = LivenessCamera()

  private let session = AVCaptureSession()
  private let output = AVCaptureVideoDataOutput()
  private let captureQueue = DispatchQueue(label: "com.cypurge.liveness.capture")
  private let encodeQueue = DispatchQueue(
    label: "com.cypurge.liveness.encode", attributes: .concurrent)
  // Serial: frames are enqueued here in capture order and sent in that order,
  // whatever order the parallel encodes finish in. M5 requires ordered frames.
  private let emitQueue = DispatchQueue(label: "com.cypurge.liveness.emit")
  private let ciContext = CIContext()
  private let lock = NSLock()
  private let encoderCount = max(2, min(6, ProcessInfo.processInfo.activeProcessorCount - 2))

  private var sink: FlutterEventSink?
  private var configured = false
  private var inFlight = 0
  private var dropped = 0
  private var encoded = 0
  private var encodeNanos: UInt64 = 0
  private var lumaSum = 0.0
  private var lumaFrames = 0

  func register(messenger: FlutterBinaryMessenger) {
    FlutterMethodChannel(name: "com.cypurge.app/liveness_camera", binaryMessenger: messenger)
      .setMethodCallHandler { [weak self] call, result in
        guard let self = self else { return }
        switch call.method {
        case "start": self.start(result)
        case "stop": result(self.stop())
        default: result(FlutterMethodNotImplemented)
        }
      }
    FlutterEventChannel(name: "com.cypurge.app/liveness_frames", binaryMessenger: messenger)
      .setStreamHandler(self)
  }

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
    -> FlutterError?
  {
    lock.lock(); sink = events; lock.unlock()
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    lock.lock(); sink = nil; lock.unlock()
    return nil
  }

  private func start(_ result: @escaping FlutterResult) {
    AVCaptureDevice.requestAccess(for: .video) { granted in
      guard granted else {
        DispatchQueue.main.async {
          result(FlutterError(code: "permission_denied", message: "camera permission not granted", details: nil))
        }
        return
      }
      self.captureQueue.async {
        do {
          let info = try self.configure()
          self.resetStats()
          if !self.session.isRunning { self.session.startRunning() }
          DispatchQueue.main.async { result(info) }
        } catch {
          DispatchQueue.main.async {
            result(FlutterError(code: "camera_failed", message: "\(error)", details: nil))
          }
        }
      }
    }
  }

  private func configure() throws -> [String: Any] {
    guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
    else { throw LivenessCameraError.noFrontCamera }

    if !configured {
      session.beginConfiguration()
      // inputPriority: the device's activeFormat (chosen below) decides size and
      // frame rate, instead of a preset overriding it.
      session.sessionPreset = .inputPriority
      let input = try AVCaptureDeviceInput(device: device)
      guard session.canAddInput(input) else {
        session.commitConfiguration()
        throw LivenessCameraError.cannotAddInput
      }
      session.addInput(input)
      output.videoSettings = [
        kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_420YpCbCr8BiPlanarFullRange
      ]
      // Drop a frame the delegate is still busy for rather than queue it: a
      // slow phone stays live instead of lagging.
      output.alwaysDiscardsLateVideoFrames = true
      output.setSampleBufferDelegate(self, queue: captureQueue)
      guard session.canAddOutput(output) else {
        session.commitConfiguration()
        throw LivenessCameraError.cannotAddOutput
      }
      session.addOutput(output)
      if let connection = output.connection(with: .video) {
        // Upright portrait and NOT mirrored — the same frames Android sends.
        // The Dart viewfinder mirrors for display; M5 un-mirrors turns itself.
        if connection.isVideoOrientationSupported { connection.videoOrientation = .portrait }
        if connection.isVideoMirroringSupported {
          connection.automaticallyAdjustsVideoMirroring = false
          connection.isVideoMirrored = false
        }
      }
      session.commitConfiguration()
      configured = true
    }

    let fps = try useFastestFormat(device)
    let dims = CMVideoFormatDescriptionGetDimensions(device.activeFormat.formatDescription)
    return [
      "width": Int(dims.width), "height": Int(dims.height),
      "fpsMax": fps, "encoders": encoderCount,
    ]
  }

  /// The smallest format covering 720p (M5's anti-spoof needs that texture;
  /// bigger only slows every stage), at its highest frame rate.
  private func useFastestFormat(_ device: AVCaptureDevice) throws -> Double {
    var best: (format: AVCaptureDevice.Format, range: AVFrameRateRange, area: Int32)?
    for format in device.formats {
      let d = CMVideoFormatDescriptionGetDimensions(format.formatDescription)
      guard d.width >= 1280, d.height >= 720,
        let range = format.videoSupportedFrameRateRanges.max(by: { $0.maxFrameRate < $1.maxFrameRate })
      else { continue }
      let area = d.width * d.height
      if let b = best,
        area > b.area || (area == b.area && range.maxFrameRate <= b.range.maxFrameRate)
      {
        continue
      }
      best = (format, range, area)
    }
    guard let pick = best else { return 0 }
    try device.lockForConfiguration()
    device.activeFormat = pick.format
    // Min duration = top rate. The max duration is left to the format's
    // default, so a dim room can lengthen exposure instead of going black.
    device.activeVideoMinFrameDuration = pick.range.minFrameDuration
    device.unlockForConfiguration()
    return pick.range.maxFrameRate
  }

  func captureOutput(
    _ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer,
    from connection: AVCaptureConnection
  ) {
    guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
    lock.lock()
    let listening = sink != nil
    let busy = inFlight >= encoderCount
    if listening && busy { dropped += 1 }
    if listening && !busy { inFlight += 1 }
    lock.unlock()
    guard listening && !busy else { return }

    let luma = meanLuma(pixelBuffer)
    let done = DispatchSemaphore(value: 0)
    var jpeg: Data?
    encodeQueue.async {
      let t0 = DispatchTime.now().uptimeNanoseconds
      jpeg = self.ciContext.jpegRepresentation(
        of: CIImage(cvPixelBuffer: pixelBuffer),
        colorSpace: CGColorSpace(name: CGColorSpace.sRGB)!,
        options: [
          CIImageRepresentationOption(rawValue: kCGImageDestinationLossyCompressionQuality as String): 0.9
        ])
      let elapsed = DispatchTime.now().uptimeNanoseconds - t0
      self.lock.lock()
      self.encoded += 1
      self.encodeNanos += elapsed
      if luma >= 0 {
        self.lumaSum += luma
        self.lumaFrames += 1
      }
      self.lock.unlock()
      done.signal()
    }
    emitQueue.async {
      done.wait()
      self.lock.lock()
      self.inFlight -= 1
      let out = self.sink
      self.lock.unlock()
      guard let data = jpeg, let out = out else { return }
      DispatchQueue.main.async { out(FlutterStandardTypedData(bytes: data)) }
    }
  }

  /// Mean luma, every 64th Y byte — see recordLuma in LivenessCamera.kt.
  private func meanLuma(_ pixelBuffer: CVPixelBuffer) -> Double {
    CVPixelBufferLockBaseAddress(pixelBuffer, .readOnly)
    defer { CVPixelBufferUnlockBaseAddress(pixelBuffer, .readOnly) }
    guard let base = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0) else { return -1 }
    let count =
      CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0) * CVPixelBufferGetHeightOfPlane(pixelBuffer, 0)
    let bytes = base.assumingMemoryBound(to: UInt8.self)
    var acc = 0
    var n = 0
    var i = 0
    while i < count {
      acc += Int(bytes[i])
      n += 1
      i += 64
    }
    return n > 0 ? Double(acc) / Double(n) : -1
  }

  private func stop() -> [String: Any] {
    captureQueue.async {
      if self.session.isRunning { self.session.stopRunning() }
    }
    lock.lock()
    defer { lock.unlock() }
    return [
      "dropped": dropped,
      "encodeMs": encoded > 0 ? Int(encodeNanos / UInt64(encoded) / 1_000_000) : 0,
      "luma": lumaFrames > 0 ? Int(lumaSum / Double(lumaFrames)) : -1,
      "encoders": encoderCount,
    ]
  }

  private func resetStats() {
    lock.lock()
    dropped = 0
    encoded = 0
    encodeNanos = 0
    lumaSum = 0
    lumaFrames = 0
    lock.unlock()
  }
}

enum LivenessCameraError: Error {
  case noFrontCamera, cannotAddInput, cannotAddOutput
}
