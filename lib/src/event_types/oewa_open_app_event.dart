import 'oewa_event.dart';

/// Defines a openApp event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaOpenAppEvent extends OewaEvent {
  OewaOpenAppEvent.maps({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'openApp',
          state: 'maps',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaOpenAppEvent.other({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'openApp',
          state: 'other',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
