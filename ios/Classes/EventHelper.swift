import Foundation
import INFOnlineLibrary

class EventHelper {
    /**
     * A full map of all predefined event types and their allowed states
     */
    static var eventTypeStateMap = [
        "advertisement.open": IOLAdvertisementEventType.open,
        "advertisement.close": IOLAdvertisementEventType.close,
        "audio.play": IOLAudioEventType.play,
        "audio.pause": IOLAudioEventType.pause,
        "audio.stop": IOLAudioEventType.stop,
        "audio.next": IOLAudioEventType.next,
        "audio.previous": IOLAudioEventType.previous,
        "audio.replay": IOLAudioEventType.replay,
        "audio.seekBack": IOLAudioEventType.seekBack,
        "audio.seekForward": IOLAudioEventType.seekForward,
        "background_task.start": IOLBackgroundTaskEventType.start,
        "background_task.end": IOLBackgroundTaskEventType.end,
        "data.cancelled": IOLDataEventType.cancelled,
        "data.refresh": IOLDataEventType.refresh,
        "data.succeeded": IOLDataEventType.succeeded,
        "data.failed": IOLDataEventType.failed,
        "device_orientation.changed": IOLViewEventType.appeared, // this event type only has one option, so this is just here so we still get into the correct switch, but not type is needed
        "document.open": IOLDocumentEventType.open,
        "document.edit": IOLDocumentEventType.edit,
        "document.close": IOLDocumentEventType.close,
        "download.cancelled": IOLDownloadEventType.cancelled,
        "download.start": IOLDownloadEventType.start,
        "download.succeeded": IOLDownloadEventType.succeeded,
        "download.failed": IOLDownloadEventType.failed,
        "game.action": IOLGameEventType.action,
        "game.started": IOLGameEventType.started,
        "game.finished": IOLGameEventType.finished,
        "game.won": IOLGameEventType.won,
        "game.lost": IOLGameEventType.lost,
        "game.highscore": IOLGameEventType.newHighscore,
        "game.achievement": IOLGameEventType.newAchievement,
        "gesture.shake": IOLViewEventType.appeared, // this event type only has one option, so this is just here so we still get into the correct switch, but not type is needed
        "hardware_button.pushed": IOLViewEventType.appeared, // this event type only has one option, so this is just here so we still get into the correct switch, but not type is needed
        "iap.started": IOLIAPEventType.started,
        "iap.finished": IOLIAPEventType.finished,
        "iap.cancelled": IOLIAPEventType.cancelled,
        "login.succeeded": IOLLoginEventType.succeeded,
        "login.failed": IOLLoginEventType.failed,
        "login.logout": IOLLoginEventType.logout,
        "open_app.maps": IOLOpenAppEventType.maps,
        "open_app.other": IOLOpenAppEventType.other,
        "push.received": IOLViewEventType.appeared, // this event type only has one option, so this is just here so we still get into the correct switch, but not type is needed
        "upload.cancelled": IOLUploadEventType.cancelled,
        "upload.start": IOLUploadEventType.start,
        "upload.succeeded": IOLUploadEventType.succeeded,
        "upload.failed": IOLUploadEventType.failed,
        "video.play": IOLVideoEventType.play,
        "video.pause": IOLVideoEventType.pause,
        "video.stop": IOLVideoEventType.stop,
        "video.next": IOLVideoEventType.next,
        "video.previous": IOLVideoEventType.previous,
        "video.replay": IOLVideoEventType.replay,
        "video.seekBack": IOLVideoEventType.seekBack,
        "video.seekForward": IOLVideoEventType.seekForward,
        "view.appeared": IOLViewEventType.appeared,
        "view.refreshed": IOLViewEventType.refreshed,
        "view.disappeared": IOLViewEventType.disappeared
    ] as [String : Any];
    
  /**
   * Tries to find the best matching EventType from our event name string.
   * The event name string is supposed to be eventIdentifier + eventState separated by "." (i.e: "view.appeared")
   *
   * If no predefined and specific event type was found, we will return a custom event.
   */
  static func getIOLEventFromString(
    eventname: String,
    category: String?,
    comment: String?,
    customParams: [String: String]?
  ) -> IOLEvent? {
    let eventSplit = eventname.split(separator: ".", maxSplits: 1).map(String.init)
    let eventIdentifier = eventSplit[0]
      
    // if we got one of out predefined event types and states -> return specific event
      if (eventTypeStateMap[eventname] != nil) {
          let eventStateType = eventTypeStateMap[eventname];
          
          // try to find the best matching event to return
          switch(eventIdentifier) {
              case "advertisement": return IOLAdvertisementEvent(type: eventStateType as! IOLAdvertisementEventType, category: category, comment: comment, parameter: customParams);
              case "audio": return IOLAudioEvent(type: eventStateType as! IOLAudioEventType, category: category, comment: comment, parameter: customParams);
              case "background_task": return IOLBackgroundTaskEvent(type: eventStateType as! IOLBackgroundTaskEventType, category: category, comment: comment, parameter: customParams);
              case "data": return IOLDataEvent(type: eventStateType as! IOLDataEventType, category: category, comment: comment, parameter: customParams);
              case "device_orientation": return IOLDeviceOrientationEvent(category: category, comment: comment, parameter: customParams);
              case "document": return IOLDocumentEvent(type: eventStateType as! IOLDocumentEventType, category: category, comment: comment, parameter: customParams);
              case "download": return IOLDownloadEvent(type: eventStateType as! IOLDownloadEventType, category: category, comment: comment, parameter: customParams);
              case "game": return IOLGameEvent(type: eventStateType as! IOLGameEventType, category: category, comment: comment, parameter: customParams);
              case "gesture": return IOLGestureEvent(category: category, comment: comment, parameter: customParams);
              case "hardware_button": return IOLHardwareButtonEvent(category: category, comment: comment, parameter: customParams);
              case "iap": return IOLIAPEvent(type: eventStateType! as! IOLIAPEventType, category: category, comment: comment, parameter: customParams);
              case "login": return IOLLoginEvent(type: eventStateType as! IOLLoginEventType, category: category, comment: comment, parameter: customParams);
              case "open_app": return IOLOpenAppEvent(type: eventStateType as! IOLOpenAppEventType, category: category, comment: comment, parameter: customParams);
              case "push": return IOLPushEvent(category: category, comment: comment, parameter: customParams);
              case "upload": return IOLUploadEvent(type: eventStateType as! IOLUploadEventType, category: category, comment: comment, parameter: customParams);
              case "video": return IOLVideoEvent(type: eventStateType as! IOLVideoEventType, category: category, comment: comment, parameter: customParams);
              case "view": return IOLViewEvent(type: eventStateType as! IOLViewEventType, category: category, comment: comment, parameter: customParams);

              default: return IOLCustomEvent(name: eventname,  category: category, comment: comment, parameter: customParams);
          }
      }
      
    // otherwise return a custom event
     return IOLCustomEvent(name: eventname,  category: category, comment: comment, parameter: customParams);
  }
}
