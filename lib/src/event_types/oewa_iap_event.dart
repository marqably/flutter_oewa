import 'oewa_event.dart';

/// Defines a iap event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaIAPEvent extends OewaEvent {
  OewaIAPEvent.started({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'iap',
          state: 'started',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaIAPEvent.finished({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'iap',
          state: 'finished',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaIAPEvent.cancelled({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'iap',
          state: 'cancelled',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
