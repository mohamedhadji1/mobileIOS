package com.example.cypurge_mobile

import android.Manifest
import android.content.Context
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

class MainActivity: FlutterFragmentActivity() {
    private val DEVICE_CHANNEL = "com.cypurge.app/device"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

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
}
