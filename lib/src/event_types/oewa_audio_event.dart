import 'oewa_event.dart';

/// Defines a audio event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaAudioEvent extends OewaEvent {
  OewaAudioEvent.play({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'play',
        );

  OewaAudioEvent.pause({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'pause',
        );

  OewaAudioEvent.stop({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'stop',
        );

  OewaAudioEvent.next({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'next',
        );

  OewaAudioEvent.previous({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'previous',
        );

  OewaAudioEvent.replay({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'replay',
        );

  OewaAudioEvent.seekBack({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'seekBack',
        );

  OewaAudioEvent.seekForward({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'audio',
          state: 'seekForward',
        );
}
