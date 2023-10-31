import 'oewa_event.dart';

/// Defines a upload event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaUploadvent extends OewaEvent {
  OewaUploadvent.cancelled({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'upload',
          state: 'cancelled',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaUploadvent.start({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'upload',
          state: 'start',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaUploadvent.succeeded({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'upload',
          state: 'succeeded',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaUploadvent.failed({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'upload',
          state: 'failed',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
