import Flutter
import UIKit
import
import Foundation

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    var channelName = "simple_channel"
    var offlineLoader = OfflineLoader()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController

        let methodChannel = FlutterMethodChannel(
            name: channelName,
            binaryMessenger: flutterViewController.binaryMessenger
        )

        methodChannel.setMethodCallHandler { [self] (call, result) in
            if call.method == "cacheMapLayer" {
                let results = offlineLoader.cacheMapLayer()
                print("Received text from Flutter: \(results)")
                result("Text received and printed: \(results)")
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
