import 'oewa_event.dart';

/// Defines a push event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaPushvent extends OewaEvent {
  OewaPushvent.push({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'push',
          state: 'received',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
