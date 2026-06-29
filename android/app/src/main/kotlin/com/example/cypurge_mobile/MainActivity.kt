package com.example.cypurge_mobile

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import android.provider.Settings
import android.telephony.CellIdentityNr
import android.telephony.CellInfo
import android.telephony.CellInfoGsm
import android.telephony.CellInfoLte
import android.telephony.CellInfoNr
import android.telephony.CellInfoWcdma
import android.telephony.TelephonyManager
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
                "getCellInfo" -> {
                    result.success(readCellInfo())
                }
                else -> result.notImplemented()
            }
        }
    }

    /**
     * Reads the registered serving cell's tower identity (CID/TAC/LAC + MCC/MNC).
     * Android-only — iOS does not expose cell identity at all. Returns an empty
     * map when permission is missing, no SIM, or the radio is unavailable so the
     * Dart side simply records null fields instead of failing the batch.
     */
    private fun readCellInfo(): Map<String, Any?> {
        val out = HashMap<String, Any?>()
        try {
            val hasLocation = checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) ==
                PackageManager.PERMISSION_GRANTED
            val hasPhone = checkSelfPermission(Manifest.permission.READ_PHONE_STATE) ==
                PackageManager.PERMISSION_GRANTED
            if (!hasLocation && !hasPhone) return out

            val tm = getSystemService(Context.TELEPHONY_SERVICE) as? TelephonyManager ?: return out
            val cells: List<CellInfo> = tm.allCellInfo ?: return out
            val api28 = Build.VERSION.SDK_INT >= Build.VERSION_CODES.P

            for (info in cells) {
                if (!info.isRegistered) continue
                when {
                    info is CellInfoLte -> {
                        val id = info.cellIdentity
                        out["cell_radio"] = "LTE"
                        out["cell_id"] = id.ci.takeIf { it != Int.MAX_VALUE }?.toString()
                        out["cell_tac"] = id.tac.takeIf { it != Int.MAX_VALUE }?.toString()
                        if (api28) { out["cell_mcc"] = id.mccString; out["cell_mnc"] = id.mncString }
                    }
                    info is CellInfoGsm -> {
                        val id = info.cellIdentity
                        out["cell_radio"] = "GSM"
                        out["cell_id"] = id.cid.takeIf { it != Int.MAX_VALUE }?.toString()
                        out["cell_lac"] = id.lac.takeIf { it != Int.MAX_VALUE }?.toString()
                        if (api28) { out["cell_mcc"] = id.mccString; out["cell_mnc"] = id.mncString }
                    }
                    info is CellInfoWcdma -> {
                        val id = info.cellIdentity
                        out["cell_radio"] = "WCDMA"
                        out["cell_id"] = id.cid.takeIf { it != Int.MAX_VALUE }?.toString()
                        out["cell_lac"] = id.lac.takeIf { it != Int.MAX_VALUE }?.toString()
                        if (api28) { out["cell_mcc"] = id.mccString; out["cell_mnc"] = id.mncString }
                    }
                    Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && info is CellInfoNr -> {
                        val id = info.cellIdentity as CellIdentityNr
                        out["cell_radio"] = "NR"
                        out["cell_id"] = id.nci.takeIf { it != Long.MAX_VALUE }?.toString()
                        out["cell_tac"] = id.tac.takeIf { it != Int.MAX_VALUE }?.toString()
                        out["cell_mcc"] = id.mccString
                        out["cell_mnc"] = id.mncString
                    }
                }
                if (out.isNotEmpty()) break
            }
        } catch (e: SecurityException) {
            // Permission revoked at runtime — leave map empty.
        } catch (e: Exception) {
            // OEM/driver quirk reading cell info — leave map empty.
        }
        return out
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

