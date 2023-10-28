import 'oewa_event.dart';

/// Defines a audio event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaAudioEvent extends OewaEvent {
  OewaAudioEvent.play({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'play',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaAudioEvent.pause({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'pause',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaAudioEvent.stop({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'stop',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaAudioEvent.next({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'next',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaAudioEvent.previous({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'previous',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaAudioEvent.replay({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'replay',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaAudioEvent.seekBack({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'seekBack',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaAudioEvent.seekForward({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'seekForward',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
