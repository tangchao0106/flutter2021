package com.example.untitled


import android.content.BroadcastReceiver
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodCall
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {

    private val BATTERY_CHANNEL = "samples.flutter.io/battery"
    private val CHARGING_CHANNEL = "samples.flutter.io/charging"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor,
            BATTERY_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {

                val batteryLevel: Int = getBatteryLevel()
                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else if (call.method == "TwoActivity") {
                var Intent = Intent(this, TwoActivity::class.java)
                startActivity(Intent)
                result.success("跳转原生页面成功")
            } else if (call.method == "withParams") {
                //解析参数
//                val text = call.argument<String>("flutter")
                var aa = call.arguments as Map<String,String>


                result.success("原生页面解析参数" + aa.get("flutter"))
            } else {
                result.notImplemented()
            }
        }
//----------

//        EventChannel(flutterEngine.dartExecutor, CHARGING_CHANNEL).setStreamHandler(
//            object : StreamHandler {
//                private var chargingStateChangeReceiver: BroadcastReceiver? = null
//                override fun onListen(arguments: Any, events: EventSink) {
//                    chargingStateChangeReceiver = createChargingStateChangeReceiver(events)
//                    registerReceiver(
//                        chargingStateChangeReceiver, IntentFilter(Intent.ACTION_BATTERY_CHANGED)
//                    )
//                }
//
//                override fun onCancel(arguments: Any) {
//                    unregisterReceiver(chargingStateChangeReceiver)
//                    chargingStateChangeReceiver = null
//                }
//            }
//        )
    }
    private fun createChargingStateChangeReceiver(events: EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1)
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    events.error("UNAVAILABLE", "Charging status unavailable", null)
                } else {
                    val isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                            status == BatteryManager.BATTERY_STATUS_FULL
                    events.success(if (isCharging) "charging" else "discharging")
                }
            }
        }
    }
    private fun getBatteryLevel(): Int {
        return if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null,
                IntentFilter(Intent.ACTION_BATTERY_CHANGED)
            )
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
    }
}
