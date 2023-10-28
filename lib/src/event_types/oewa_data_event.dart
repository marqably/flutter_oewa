import 'oewa_event.dart';

/// Defines a data event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaDataEvent extends OewaEvent {
  OewaDataEvent.cancelled({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'data',
          state: 'cancelled',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaDataEvent.refresh({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'data',
          state: 'refresh',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaDataEvent.succeeded({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'data',
          state: 'succeeded',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaDataEvent.failed({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'data',
          state: 'failed',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
