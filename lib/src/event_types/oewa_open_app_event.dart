import 'oewa_event.dart';

/// Defines a openApp event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaOpenAppEvent extends OewaEvent {
  OewaOpenAppEvent.maps({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'openApp',
          state: 'maps',
        );

  OewaOpenAppEvent.other({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'openApp',
          state: 'other',
        );
}
