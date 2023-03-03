package com.example.dorado_map;
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("7db7f48e-dd67-4c8c-9d8b-15677d43d8cc") // Your generated API key
        super.configureFlutterEngine(flutterEngine)
    }
}