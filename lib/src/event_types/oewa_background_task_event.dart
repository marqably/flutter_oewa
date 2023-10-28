import 'oewa_event.dart';

/// Defines a backgroundTask event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaBackgroundTaskEvent extends OewaEvent {
  OewaBackgroundTaskEvent.start({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'backgroundTask',
          state: 'start',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaBackgroundTaskEvent.end({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'backgroundTask',
          state: 'end',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
