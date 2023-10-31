import 'oewa_event.dart';

/// Defines a deviceOrientation event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaDeviceOrientationEvent extends OewaEvent {
  OewaDeviceOrientationEvent.changed({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'deviceOrientation',
          state: 'changed',
        );
}
