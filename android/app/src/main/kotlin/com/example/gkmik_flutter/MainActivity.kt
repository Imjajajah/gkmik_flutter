package com.example.gkmik_flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine) // Call the super method
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        flutterEngine.plugins.add(io.flutter.plugins.webviewflutter.WebViewFlutterPlugin())
    }
}