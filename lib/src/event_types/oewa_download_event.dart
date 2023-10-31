import 'oewa_event.dart';

/// Defines a download event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaDownloadEvent extends OewaEvent {
  OewaDownloadEvent.cancelled({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'download',
          state: 'cancelled',
        );

  OewaDownloadEvent.start({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'download',
          state: 'start',
        );

  OewaDownloadEvent.succeeded({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'download',
          state: 'succeeded',
        );

  OewaDownloadEvent.failed({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'download',
          state: 'failed',
        );
}
