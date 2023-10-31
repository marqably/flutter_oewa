import 'oewa_event.dart';

/// Defines a data event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaDataEvent extends OewaEvent {
  OewaDataEvent.cancelled({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'data',
          state: 'cancelled',
        );

  OewaDataEvent.refresh({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'data',
          state: 'refresh',
        );

  OewaDataEvent.succeeded({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'data',
          state: 'succeeded',
        );

  OewaDataEvent.failed({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'data',
          state: 'failed',
        );
}
