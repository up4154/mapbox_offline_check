package com.example.mapbox_offline_check

import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.mapbox.maps.mapbox_maps.OfflineLoader

class TextGenerate : MainActivity() {
     val channelName = "text_channel"


//    val offlineLoader=OfflineLoader()


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName).setMethodCallHandler { call, result ->
            if (call.method == "printText") {
                val textToPrint = call.arguments as String
                println("Received text from Flutter: $textToPrint")
                result.success("Text received and printed: $textToPrint")
            } else {
                result.notImplemented()
            }
        }
    }
}
