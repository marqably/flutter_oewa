import 'oewa_event.dart';

/// Defines a deviceOrientation event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaDeviceOrientationEvent extends OewaEvent {
  OewaDeviceOrientationEvent.changed({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'deviceOrientation',
          state: 'changed',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
