import 'oewa_event.dart';

/// Defines a advertisement event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaAdvertisementEvent extends OewaEvent {
  OewaAdvertisementEvent.open({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'advertisement',
          state: 'open',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaAdvertisementEvent.close({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'advertisement',
          state: 'close',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
