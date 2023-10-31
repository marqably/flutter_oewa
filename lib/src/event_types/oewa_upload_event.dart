import 'oewa_event.dart';

/// Defines a upload event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaUploadvent extends OewaEvent {
  OewaUploadvent.cancelled({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'upload',
          state: 'cancelled',
        );

  OewaUploadvent.start({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'upload',
          state: 'start',
        );

  OewaUploadvent.succeeded({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'upload',
          state: 'succeeded',
        );

  OewaUploadvent.failed({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'upload',
          state: 'failed',
        );
}
