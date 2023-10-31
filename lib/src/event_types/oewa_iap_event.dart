import 'oewa_event.dart';

/// Defines a iap event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaIAPEvent extends OewaEvent {
  OewaIAPEvent.started({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'iap',
          state: 'started',
        );

  OewaIAPEvent.finished({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'iap',
          state: 'finished',
        );

  OewaIAPEvent.cancelled({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'iap',
          state: 'cancelled',
        );
}
