import 'oewa_event.dart';

/// Defines a view event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaViewEvent extends OewaEvent {
  /// Creates a specific event that tracks the appearance of a view.
  /// This is the most common event type.
  OewaViewEvent.appeared({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'view',
          state: 'appeared',
        );

  /// Creates an event that tracks refershing of a view.
  OewaViewEvent.refreshed({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'view',
          state: 'refreshed',
        );

  /// Creates an event that tracks disappearance of a view.
  OewaViewEvent.disappeared({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'view',
          state: 'disappeared',
        );
}
