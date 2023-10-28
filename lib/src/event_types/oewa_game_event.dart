import 'oewa_event.dart';

/// Defines a game event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaGameEvent extends OewaEvent {
  OewaGameEvent.action({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'action',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaGameEvent.start({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'start',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaGameEvent.finished({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'finished',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaGameEvent.won({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'won',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaGameEvent.lost({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'lost',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaGameEvent.highscore({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'highscore',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaGameEvent.achievement({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'game',
          state: 'achievement',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
