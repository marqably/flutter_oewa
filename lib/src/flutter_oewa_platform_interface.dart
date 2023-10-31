import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_oewa_method_channel.dart';
import 'event_types/oewa_event.dart';

abstract class FlutterOewaPlatform extends PlatformInterface {
  /// Constructs a FlutterOewaPlatform.
  FlutterOewaPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterOewaPlatform _instance = MethodChannelFlutterOewa();

  /// The default instance of [FlutterOewaPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterOewa].
  static FlutterOewaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterOewaPlatform] when
  /// they register themselves.
  static set instance(FlutterOewaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Opens a new session, that can be used to track events using [logEvent] later on.
  Future<String?> initIOLSession(String offerIdentifier,
      [bool debugMode = false]) {
    throw UnimplementedError('initIOLSession() has not been implemented.');
  }

  /// Starts a session to track and send events to the OEWA server.
  Future<String?> startSession(String? offerIdentifier) {
    throw UnimplementedError('startSession() has not been implemented.');
  }

  /// Terminates a session and stops tracking and sending events to the OEWA server.
  Future<String?> terminateSession() {
    throw UnimplementedError('terminateSession() has not been implemented.');
  }

  /// The IOLib controls sending of the measurement data independently and entirely transparently. sendLoggedEvents may be accessed to force sending of the data. The IOLib then attempts to send the measured data immediately or to resend it, as soon as a data connection has been established.
  Future<String?> sendLoggedEvents() {
    throw UnimplementedError('sendLoggedEvents() has not been implemented.');
  }

  /// The measurement library can be put into debug mode. Various outputs in the log flow are generated here (errors, warnings, information, events and requests).
  Future<String?> setDebugModeEnabled(bool enable) {
    throw UnimplementedError('setDebugModeEnabled() has not been implemented.');
  }

  /// Logs/Tracks a user event
  /// This is the most important method in this package, because this allows us to set up the tracking and analyse user actions.
  Future<String?> logEvent(OewaEvent event) {
    throw UnimplementedError('logEvent() has not been implemented.');
  }
}
