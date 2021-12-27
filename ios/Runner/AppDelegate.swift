import UIKit
import Flutter
import FBSDKLoginKit
import FBSDKCoreKit
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    ApplicationDelegate.shared.application( application, didFinishLaunchingWithOptions: launchOptions)
    
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyC5sashDXaKHiNRR4DO4fDTnRQHMWnNbLI")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

}
