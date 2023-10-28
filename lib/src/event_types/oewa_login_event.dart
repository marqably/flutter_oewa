import 'oewa_event.dart';

/// Defines a login event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaLoginEvent extends OewaEvent {
  OewaLoginEvent.succeeded({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'login',
          state: 'succeeded',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaLoginEvent.failed({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'login',
          state: 'failed',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaLoginEvent.logout({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'login',
          state: 'logout',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
