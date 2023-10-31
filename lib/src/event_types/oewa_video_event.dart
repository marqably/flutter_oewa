import 'oewa_event.dart';

/// Defines a video event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaVideoEvent extends OewaEvent {
  OewaVideoEvent.play({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'play',
        );

  OewaVideoEvent.pause({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'pause',
        );

  OewaVideoEvent.stop({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'stop',
        );

  OewaVideoEvent.next({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'next',
        );

  OewaVideoEvent.previous({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'previous',
        );

  OewaVideoEvent.replay({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'replay',
        );

  OewaVideoEvent.seekBack({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'seekBack',
        );

  OewaVideoEvent.seekForward({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'seekForward',
        );
}
