import 'oewa_event.dart';

/// Defines a download event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaDownloadEvent extends OewaEvent {
  OewaDownloadEvent.cancelled({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'download',
          state: 'cancelled',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaDownloadEvent.start({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'download',
          state: 'start',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaDownloadEvent.succeeded({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'download',
          state: 'succeeded',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaDownloadEvent.failed({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'download',
          state: 'failed',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
