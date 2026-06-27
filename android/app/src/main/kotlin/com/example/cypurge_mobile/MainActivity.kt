package com.example.cypurge_mobile

import android.content.Intent
import android.provider.Settings
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.facetec.sdk.*
import org.json.JSONObject
import java.io.OutputStreamWriter
import java.net.HttpURLConnection
import java.net.URL
import kotlin.concurrent.thread

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "com.cypurge.app/facetec"
    private val DEVICE_CHANNEL = "com.cypurge.app/device"
    private val DEVICE_KEY = "dm4TdeLOpTeIpCQYRXJChIu4RartmVZt"
    private val FACETEC_TESTING_API = "https://api.facetec.com/api/v4/biometrics/process-request"
    
    private var sdkInstance: FaceTecSDKInstance? = null
    private var pendingFlutterResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "initialize" -> {
                    FaceTecSDK.initializeWithSessionRequest(this, DEVICE_KEY, NetworkProcessor(), object : FaceTecSDK.InitializeCallback {
                        override fun onSuccess(instance: FaceTecSDKInstance) {
                            sdkInstance = instance
                            result.success(true)
                        }

                        override fun onError(error: FaceTecInitializationError) {
                            println("FaceTec Initialization Error: \$error")
                            result.success(false)
                        }
                    })
                }
                "startFaceScan", "startFaceTecLiveness" -> {
                    if (sdkInstance == null) {
                        result.success("LIVENESS_FAILED_NOT_INITIALIZED")
                        return@setMethodCallHandler
                    }
                    pendingFlutterResult = result
                    sdkInstance?.start3DLiveness(this@MainActivity, NetworkProcessor())
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, DEVICE_CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "isAirplaneModeOn" -> {
                    val on = Settings.Global.getInt(
                        contentResolver, Settings.Global.AIRPLANE_MODE_ON, 0
                    ) != 0
                    result.success(on)
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        val sessionResult = FaceTecSDK.getActivitySessionResult(requestCode, resultCode, data)
        
        if (sessionResult != null) {
            val successful = sessionResult.status == FaceTecSessionStatus.SESSION_COMPLETED
            if (successful) {
                pendingFlutterResult?.success("LIVENESS_SUCCESS")
            } else {
                pendingFlutterResult?.success("LIVENESS_FAILED")
            }
            pendingFlutterResult = null
        }
    }

    inner class NetworkProcessor : FaceTecSessionRequestProcessor {
        override fun onSessionRequest(sessionRequestBlob: String, callback: FaceTecSessionRequestProcessor.Callback) {
            thread {
                try {
                    val url = URL(FACETEC_TESTING_API)
                    val conn = url.openConnection() as HttpURLConnection
                    conn.requestMethod = "POST"
                    conn.setRequestProperty("Content-Type", "application/json")
                    conn.setRequestProperty("X-Device-Key", DEVICE_KEY)
                    conn.setRequestProperty("X-Testing-API-Header", FaceTecSDK.getTestingAPIHeader())
                    conn.doOutput = true

                    val json = JSONObject()
                    json.put("requestBlob", sessionRequestBlob)

                    OutputStreamWriter(conn.outputStream).use { it.write(json.toString()) }

                    if (conn.responseCode == 200) {
                        val responseBody = conn.inputStream.bufferedReader().use { it.readText() }
                        val responseJson = JSONObject(responseBody)
                        val responseBlob = responseJson.optString("responseBlob", "")
                        callback.processResponse(responseBlob)
                    } else {
                        callback.abortOnCatastrophicError()
                    }
                } catch (e: Exception) {
                    e.printStackTrace()
                    callback.abortOnCatastrophicError()
                }
            }
        }
    }
}

