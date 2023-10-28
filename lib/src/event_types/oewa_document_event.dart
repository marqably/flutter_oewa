import 'oewa_event.dart';

/// Defines a document event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaDocumentEvent extends OewaEvent {
  OewaDocumentEvent.open({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'document',
          state: 'open',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaDocumentEvent.edit({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'document',
          state: 'edit',
          category: category,
          comment: comment,
          customParams: customParams,
        );

  OewaDocumentEvent.close({
    String? category,
    String? comment,
    Map<String, String>? customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'document',
          state: 'close',
          category: category,
          comment: comment,
          customParams: customParams,
        );
}
