import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_oewa_platform_interface.dart';
import 'event_types/oewa_event.dart';

/// An implementation of [FlutterOewaPlatform] that uses method channels.
class MethodChannelFlutterOewa extends FlutterOewaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_oewa');

  @override
  Future<String?> initIOLSession(String offerIdentifier,
      [bool debugMode = false]) {
    var map = <dynamic, dynamic>{
      'offerIdentifier': offerIdentifier,
      'debugMode': debugMode,
    };

    return methodChannel.invokeMethod<String>('initIOLSession', map);
  }

  @override
  Future<String?> startSession(String? offerIdentifier) {
    var map = <dynamic, dynamic>{
      'offerIdentifier': offerIdentifier,
    };

    return methodChannel.invokeMethod<String>('startSession', map);
  }

  @override
  Future<String?> terminateSession() {
    return methodChannel.invokeMethod<String>('terminateSession');
  }

  @override
  Future<String?> sendLoggedEvents() {
    return methodChannel.invokeMethod<String>('sendLoggedEvents');
  }

  @override
  Future<String?> setDebugModeEnabled(bool enable) {
    var map = <dynamic, dynamic>{
      'enable': enable,
    };
    return methodChannel.invokeMethod<String>('setDebugModeEnabled', map);
  }

  @override
  Future<String?> logEvent(OewaEvent event) {
    var map = <dynamic, dynamic>{
      'identifier': event.identifier,
      'state': event.state,
      'category': event.category,
      'comment': event.comment,
      'customParams': event.customParams,
    };

    return methodChannel.invokeMethod<String>('logEvent', map);
  }
}
