import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideApiKey("AIzaSyCNoSv-lJ077FKWJ-tbr3iy290A-61qP1c")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
