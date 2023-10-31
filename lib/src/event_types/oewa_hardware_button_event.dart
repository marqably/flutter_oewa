import 'oewa_event.dart';

/// Defines a hardwareButton event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaHardwareButtonEvent extends OewaEvent {
  OewaHardwareButtonEvent.pushed({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'hardwareButton',
          state: 'pushed',
        );
}
