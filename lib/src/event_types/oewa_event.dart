/// Defines an interaction event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaEvent {
  final String identifier;
  final String state;
  final String? category;
  final String? comment;
  final Map<String, String>? customParams;

  OewaEvent({
    required this.identifier,
    required this.state,
    required this.category,
    this.comment,
    this.customParams,
  });
}
