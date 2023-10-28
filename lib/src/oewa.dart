import 'dart:convert';

import 'event_types/oewa_event.dart';
import 'flutter_oewa_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String optOutSharedPrefKey = 'oewa_opted_out_status';
const String sessionDetailsSharedPrefKey = 'oewa_session_details';

class Oewa {
  /// Opens a new session, that can be used to track events using [logEvent] later on.
  ///
  /// If you are developing [debugMode] will help you by providing logs about the events that are being sent.
  ///
  /// If [privacyMode] is set to `true` (default) we are going to check the opt out status automatically. (set this to `false` if you don't need opt outs or you implement it yourself)
  /// To set the default optOutStatus you want to start with, you can provide [optOutStatus] with a value, where `true` means, that no requests will be made until the user manually opts in using [optIn], because the user is opted out.
  static Future<bool> initIOLSession(
    String offerIdentifier, {
    bool debugMode = false,
    bool? privacyMode = true,
    bool? optOutState,
  }) async {
    // if we pass a default opt out status -> set it before we continue
    if (optOutState != null && await getOptOutStatus() != optOutState) {
      if (optOutState == true) {
        await optOut();
      } else {
        await optIn();
      }
    }

    // if we want to check the opt in status, we check shared preferences for the opt in status
    if (privacyMode == true) {
      // if we are in privacy mode, we might need some infos later, when restarting session -> so save them in shared preferences so we don't have to ask them again
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          sessionDetailsSharedPrefKey,
          json.encode({
            'offerIdentifier': offerIdentifier,
            'debugMode': debugMode,
          }));

      // if get opt out status is true -> don't do anything else
      if (await getOptOutStatus()) {
        return false;
      }
    }

    final res = await FlutterOewaPlatform.instance
        .initIOLSession(offerIdentifier, debugMode);
    return res == 'true';
  }

  /// Starts a session to track and send events to the OEWA server.
  static Future<bool> startSession() async {
    if (await getOptOutStatus()) {
      return false;
    }

    final res = await FlutterOewaPlatform.instance.startSession();
    return res == 'true';
  }

  /// Terminates a session and stops tracking and sending events to the OEWA server.
  static Future<bool> terminateSession() async {
    final res = await FlutterOewaPlatform.instance.terminateSession();
    return res == 'true';
  }

  /// The IOLib controls sending of the measurement data independently and entirely transparently. sendLoggedEvents may be accessed to force sending of the data. The IOLib then attempts to send the measured data immediately or to resend it, as soon as a data connection has been established.
  static Future<bool> sendLoggedEvents() async {
    final res = await FlutterOewaPlatform.instance.sendLoggedEvents();
    return res == 'true';
  }

  /// The measurement library can be put into debug mode. Various outputs in the log flow are generated here (errors, warnings, information, events and requests).
  static Future<bool> setDebugModeEnabled(bool enable) async {
    final res = await FlutterOewaPlatform.instance.setDebugModeEnabled(enable);
    return res == 'true';
  }

  /// Logs/Tracks a user event
  /// This is the most important method in this package, because this allows us to set up the tracking and analyse user actions.
  ///
  /// You can pass any [event] that extends [OewaEvent] to this method. You can find all available predefined events in [./lib/src/event_types/]. You can also create your own events by extending [OewaEvent].
  /// If [privacyMode] is set to `true` (default) we are going to check the opt out status automatically. (set this to `false` if you don't need opt outs or you implement it yourself)
  static Future<bool> logEvent(
    OewaEvent event, {
    bool? privacyMode = true,
  }) async {
    // if we want to check the opt in status, we check shared preferences for the opt in status
    if (privacyMode == true) {
      if (await getOptOutStatus()) {
        return false;
      }
    }

    // if not, we don't track the event
    final res = await FlutterOewaPlatform.instance.logEvent(event);

    return res == 'true';
  }

  /// Opts the user out of tracking by terminating the current session and making sure no further events are sent
  /// The opt in state is saved in shared preferences
  static Future<bool> optOut() async {
    // terminate current session
    await terminateSession();

    // now save the opt in status in shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(optOutSharedPrefKey, true);
  }

  /// Opts the user in again of tracking by resetting the opt out status in shared preferences and starting a new session
  static Future<bool> optIn() async {
    // now save the opt in status in shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // if we have a session detail key (we probably did not start a session yet) -> init session with these details
    if (prefs.containsKey(sessionDetailsSharedPrefKey)) {
      final sessionDetails =
          json.decode(prefs.getString(sessionDetailsSharedPrefKey) ?? '{}');

      // start session with these data
      await FlutterOewaPlatform.instance.initIOLSession(
        sessionDetails['offerIdentifier'],
        sessionDetails['debugMode'],
      );

      // remove session detail key in shared prefs
      await prefs.remove(sessionDetailsSharedPrefKey);
    }

    // remove the opt out state "cookkie"
    await prefs.remove(optOutSharedPrefKey);

    // start a new session
    return await startSession();
  }

  /// Returns the current opt out status
  static Future<bool> getOptOutStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final optedOut = prefs.getBool(optOutSharedPrefKey) ?? false;

    return optedOut;
  }
}
