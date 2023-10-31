import 'oewa_event.dart';

/// Defines a advertisement event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaAdvertisementEvent extends OewaEvent {
  OewaAdvertisementEvent.open({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'advertisement',
          state: 'open',
        );

  OewaAdvertisementEvent.close({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'advertisement',
          state: 'close',
        );
}
