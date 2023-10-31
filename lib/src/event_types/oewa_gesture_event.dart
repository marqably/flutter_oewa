import 'oewa_event.dart';

/// Defines a gesture event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaGestureEvent extends OewaEvent {
  OewaGestureEvent.shake({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'gesture',
          state: 'shake',
        );
}
