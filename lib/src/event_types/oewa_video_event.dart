import 'oewa_event.dart';

/// Defines a video event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaVideoEvent extends OewaEvent {
  OewaVideoEvent.play({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'play',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaVideoEvent.pause({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'pause',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaVideoEvent.stop({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'stop',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaVideoEvent.next({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'next',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaVideoEvent.previous({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'previous',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaVideoEvent.replay({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'replay',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaVideoEvent.seekBack({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'seekBack',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaVideoEvent.seekForward({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'video',
          state: 'seekForward',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
