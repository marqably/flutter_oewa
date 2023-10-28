import 'oewa_event.dart';

/// Defines a view event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaViewEvent extends OewaEvent {
  /// Creates a specific event that tracks the appearance of a view.
  /// This is the most common event type.
  OewaViewEvent.appeared({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'view',
          state: 'appeared',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  /// Creates an event that tracks refershing of a view.
  OewaViewEvent.refreshed({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'view',
          state: 'refreshed',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  /// Creates an event that tracks disappearance of a view.
  OewaViewEvent.disappeared({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'view',
          state: 'disappeared',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
