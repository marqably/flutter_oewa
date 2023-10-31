import 'oewa_event.dart';

/// Defines a login event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaLoginEvent extends OewaEvent {
  OewaLoginEvent.succeeded({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'login',
          state: 'succeeded',
        );

  OewaLoginEvent.failed({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'login',
          state: 'failed',
        );

  OewaLoginEvent.logout({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'login',
          state: 'logout',
        );
}
