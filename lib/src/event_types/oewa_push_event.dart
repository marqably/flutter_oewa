import 'oewa_event.dart';

/// Defines a push event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaPushvent extends OewaEvent {
  OewaPushvent.push({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'push',
          state: 'received',
        );
}
