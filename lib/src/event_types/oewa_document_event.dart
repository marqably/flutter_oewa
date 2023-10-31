import 'oewa_event.dart';

/// Defines a document event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaDocumentEvent extends OewaEvent {
  OewaDocumentEvent.open({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'document',
          state: 'open',
        );

  OewaDocumentEvent.edit({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'document',
          state: 'edit',
        );

  OewaDocumentEvent.close({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'document',
          state: 'close',
        );
}
