import 'oewa_event.dart';

/// Defines a backgroundTask event, that can be passed to the [FlutterOewa.logEvent] method.
class OewaBackgroundTaskEvent extends OewaEvent {
  OewaBackgroundTaskEvent.start({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'backgroundTask',
          state: 'start',
        );

  OewaBackgroundTaskEvent.end({
    super.category,
    super.comment,
    super.customParams,
    Map<String, String>? predefinedParams,
  }) : super(
          identifier: 'backgroundTask',
          state: 'end',
        );
}
