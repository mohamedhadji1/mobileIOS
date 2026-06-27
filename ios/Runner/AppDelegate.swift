import Flutter
import UIKit
import FaceTecSDK

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, FaceTecSessionDelegate {
  private let DEVICE_KEY = "dm4TdeLOpTeIpCQYRXJChIu4RartmVZt"
  private let FACETEC_TESTING_API = "https://api.facetec.com/api/v4/biometrics/process-request"
  
  private var pendingFlutterResult: FlutterResult?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let faceTecChannel = FlutterMethodChannel(name: "com.cypurge.app/facetec",
                                              binaryMessenger: controller.binaryMessenger)
    
    faceTecChannel.setMethodCallHandler({ [weak self]
      (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard let self = self else { return }
      
      if call.method == "initialize" {
        let processor = NetworkProcessor(deviceKey: self.DEVICE_KEY, apiUrl: self.FACETEC_TESTING_API)
        FaceTec.sdk.initializeInDevelopmentMode(deviceKeyIdentifier: self.DEVICE_KEY, faceScanEncryptionKey: "") { success in
            // Fallback for v9 style if initializeWithSessionRequest is not perfectly matched,
            // but FaceTec v10 iOS usually uses FaceTec.sdk.initializeInDevelopmentMode(deviceKeyIdentifier: faceScanEncryptionKey: faceScanEncryptionKey)
            // Wait, v10 uses FaceTec.sdk.initializeInDevelopmentMode(deviceKeyIdentifier: "key", faceScanEncryptionKey: "key")?
            // Actually, v10 iOS is:
        }
        
        // FaceTec.sdk.initializeWithSessionRequest is the v10 way. We will try v10 standard:
        FaceTec.sdk.initializeWithSessionRequest(deviceKeyIdentifier: self.DEVICE_KEY, sessionRequestProcessor: processor) { success in
            result(success)
        }
      } else if call.method == "startFaceScan" || call.method == "startFaceTecLiveness" {
        self.pendingFlutterResult = result
        let processor = NetworkProcessor(deviceKey: self.DEVICE_KEY, apiUrl: self.FACETEC_TESTING_API)
        let sessionVC = FaceTec.sdk.createSessionVC(faceTecSessionDelegate: self, sessionRequestProcessor: processor)
        controller.present(sessionVC, animated: true, completion: nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func onFaceTecSDKCompletelyDone() {
      // Delegate called when session is completely done.
  }

  func processSessionWhileFaceTecUICalled(sessionResult: FaceTecSessionResult) {
      if sessionResult.status == .sessionCompletedSuccessfully {
          self.pendingFlutterResult?("LIVENESS_SUCCESS")
      } else {
          self.pendingFlutterResult?("LIVENESS_FAILED")
      }
      self.pendingFlutterResult = nil
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }
}

class NetworkProcessor: NSObject, FaceTecSessionRequestProcessor {
    let deviceKey: String
    let apiUrl: String
    
    init(deviceKey: String, apiUrl: String) {
        self.deviceKey = deviceKey
        self.apiUrl = apiUrl
    }
    
    func onSessionRequest(sessionRequestBlob: String, sessionRequestCallback: FaceTecSessionRequestCallback) {
        guard let url = URL(string: apiUrl) else {
            sessionRequestCallback.abortOnCatastrophicError()
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(deviceKey, forHTTPHeaderField: "X-Device-Key")
        request.setValue(FaceTec.sdk.getTestingAPIHeader(), forHTTPHeaderField: "X-Testing-API-Header")
        
        let parameters: [String: Any] = ["requestBlob": sessionRequestBlob]
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let responseBlob = json["responseBlob"] as? String {
                sessionRequestCallback.processResponse(responseBlob)
            } else {
                sessionRequestCallback.abortOnCatastrophicError()
            }
        }
        task.resume()
    }
}

