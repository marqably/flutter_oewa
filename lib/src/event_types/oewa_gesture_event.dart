import 'oewa_event.dart';

/// Defines a gesture event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaGestureEvent extends OewaEvent {
  OewaGestureEvent.shake({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'gesture',
          state: 'shake',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
