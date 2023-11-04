import Flutter
import INFOnlineLibrary
import UIKit

public class FlutterOewaPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_oewa", binaryMessenger: registrar.messenger())
    let instance = FlutterOewaPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let args = call.arguments as? [String: Any]

    switch call.method {
    // initIOLSession
    case "initIOLSession":
      let offerIdentifier = args?["offerIdentifier"] as! String
      let debugMode = args?["debugMode"] as? Bool
      // set debug level
      if (debugMode != nil && debugMode == true) {
        setDebugLevel(enable: true);
      }

      // start the session
      IOLSession.defaultSession(for: .OEWA).start(withOfferIdentifier: offerIdentifier, privacyType: .LIN)
        
      result("true")

    // startSession
    case "startSession":
      let offerIdentifier = args?["offerIdentifier"] as! String

      // start the session
      IOLSession.defaultSession(for: .OEWA).start(withOfferIdentifier: offerIdentifier, privacyType: .LIN)
      result("true")

    // terminateSession
    case "terminateSession":
      IOLSession.defaultSession(for: .OEWA).terminateSession()
      result("true")

    // sendLoggedEvents
    case "sendLoggedEvents":
      IOLSession.defaultSession(for: .OEWA).sendLoggedEvents()
      result("true")

    // setDebugModeEnabled
    case "setDebugModeEnabled":
      let enable = args?["enable"] as! Bool

      setDebugLevel(enable: enable)
      result("true")

    // logEvent
    case "logEvent":
      let identifier = args?["identifier"] as! String
      let state = args?["state"] as! String
      let category = args?["category"] as? String
      let comment = args?["comment"] as? String
      let customParams = args?["customParams"] as? [String: String]

      // get the best matching event
      let event = EventHelper.getIOLEventFromString(
        eventname: "\(identifier).\(state)",
        category: category,
        comment: comment,
        customParams: customParams
      )

      // call it
      if event != nil {
        IOLSession.defaultSession(for: .OEWA).logEvent(event!)
        result("true")
      } else {
        result("false")
      }

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  /**
   * Depending on the enable parameter, it will enable or disable the debug logging
   */
  private func setDebugLevel(enable: Bool) {
    if enable {
      return IOLLogging.setDebugLogLevel(.trace)
    } else {
      return IOLLogging.setDebugLogLevel(.off)
    }
  }
}