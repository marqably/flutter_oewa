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

const oewaEventIdentifierMap = {
  "advertisement": "IOLAdvertisementEvent",
  "audio": "IOLAudioEvent",
  "background_task": "IOLBackgroundTaskEvent",
  "data": "IOLDataEvent",
  "device_orientation": "IOLDeviceOrientationEvent",
  "document": "IOLDocumentEvent",
  "download": "IOLDownloadEvent",
  "game": "IOLGameEvent",
  "gesture": "IOLGestureEvent",
  "hardware_button": "IOLHardwareButtonEvent",
  "iap": "IOLIAPEvent",
  "login": "IOLLoginEvent",
  "open_app": "IOLOpenAppEvent",
  "push": "IOLPushEvent",
  "upload": "IOLUploadEvent",
  "video": "IOLVideoEvent",
  "view": "IOLViewEvent",
};
