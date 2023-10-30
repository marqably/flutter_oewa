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
      setDebugLevel(enable: true)

      // start the session
      result(
        IOLSession.defaultSession(for: .OEWA).start(
          withOfferIdentifier: offerIdentifier, privacyType: .LIN))

    // startSession
    case "startSession":
      let offerIdentifier = args?["offerIdentifier"] as! String

      // start the session
      result(
        IOLSession.defaultSession(for: .OEWA).start(
          withOfferIdentifier: offerIdentifier, privacyType: .LIN))

    // terminateSession
    case "terminateSession":
      result(IOLSession.defaultSession(for: .OEWA).terminateSession())

    // sendLoggedEvents
    case "sendLoggedEvents":
      result(IOLSession.defaultSession(for: .OEWA).sendLoggedEvents())

    // setDebugModeEnabled
    case "setDebugModeEnabled":
      let enable = args?["enable"] as! Bool

      return result(setDebugLevel(enable: enable))

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
        result(IOLSession.defaultSession(for: .OEWA).logEvent(event!))
      } else {
        result(false)
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
