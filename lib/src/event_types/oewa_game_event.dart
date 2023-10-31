import 'oewa_event.dart';

/// Defines a game event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaGameEvent extends OewaEvent {
  OewaGameEvent.action({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'action',
        );

  OewaGameEvent.start({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'start',
        );

  OewaGameEvent.finished({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'finished',
        );

  OewaGameEvent.won({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'won',
        );

  OewaGameEvent.lost({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'lost',
        );

  OewaGameEvent.highscore({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'highscore',
        );

  OewaGameEvent.achievement({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'achievement',
        );
}
