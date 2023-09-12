import Flutter
import UIKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller: FlutterViewController = window?.rootViewController as! FlutterViewController

    // Create a Method Channel
    let methodChannel = FlutterMethodChannel(
      name: "simple_channel", // Match the channel name with Dart
      binaryMessenger: controller.binaryMessenger
    )

    // Register a method handler
    methodChannel.setMethodCallHandler { [weak self] (call, result) in
      if call.method == "cacheMapLayer" {
        // Call your Swift function here
        let resultFromSwift = self?.cacheMapLayer()
        result(resultFromSwift)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // Define your Swift function
  func cacheMapLayer() -> String {
    // Implement your Swift functionality here
    return "Hello from Swift!"
  }
}
