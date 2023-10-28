import 'oewa_event.dart';

/// Defines a hardwareButton event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaHardwareButtonEvent extends OewaEvent {
  OewaHardwareButtonEvent.pushed({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'hardwareButton',
          state: 'pushed',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
