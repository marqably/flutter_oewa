package com.marqably.flutter_oewa

import android.util.Log
import de.infonline.lib.IOLAdvertisementEvent
import de.infonline.lib.IOLAdvertisementEvent.IOLAdvertisementEventType
import de.infonline.lib.IOLAudioEvent
import de.infonline.lib.IOLAudioEvent.IOLAudioEventType
import de.infonline.lib.IOLBackgroundTaskEvent
import de.infonline.lib.IOLBackgroundTaskEvent.IOLBackgroundTaskEventType
import de.infonline.lib.IOLCustomEvent
import de.infonline.lib.IOLDataEvent
import de.infonline.lib.IOLDataEvent.IOLDataEventType
import de.infonline.lib.IOLDeviceOrientationEvent
import de.infonline.lib.IOLDeviceOrientationEvent.IOLDeviceOrientationEventType
import de.infonline.lib.IOLDocumentEvent
import de.infonline.lib.IOLDocumentEvent.IOLDocumentEventType
import de.infonline.lib.IOLDownloadEvent
import de.infonline.lib.IOLDownloadEvent.IOLDownloadEventType
import de.infonline.lib.IOLEvent
import de.infonline.lib.IOLGameEvent
import de.infonline.lib.IOLGameEvent.IOLGameEventType
import de.infonline.lib.IOLGestureEvent
import de.infonline.lib.IOLGestureEvent.IOLGestureEventType
import de.infonline.lib.IOLHardwareButtonEvent
import de.infonline.lib.IOLHardwareButtonEvent.IOLHardwareButtonEventType
import de.infonline.lib.IOLIAPEvent
import de.infonline.lib.IOLIAPEvent.IOLIAPEventType
import de.infonline.lib.IOLLoginEvent
import de.infonline.lib.IOLLoginEvent.IOLLoginEventType
import de.infonline.lib.IOLOpenAppEvent
import de.infonline.lib.IOLOpenAppEvent.IOLOpenAppEventType
import de.infonline.lib.IOLPushEvent
import de.infonline.lib.IOLPushEvent.IOLPushEventType
import de.infonline.lib.IOLUploadEvent
import de.infonline.lib.IOLUploadEvent.IOLUploadEventType
import de.infonline.lib.IOLVideoEvent
import de.infonline.lib.IOLVideoEvent.IOLVideoEventType
import de.infonline.lib.IOLViewEvent
import de.infonline.lib.IOLViewEvent.IOLViewEventType

/**
 * Based on the EventHelper.java example code from the OEWA SDK Demo by Lars Heinze (20.11.17).
 */
object EventHelper {
    /**
     * Takes a combined identifier + state string (separated by ".") and returns the corresponding IOLEvent instance
     */
    fun getIOLEventFromString(
        eventname: String,
        category: String?,
        comment: String?,
        customParams: Map<String?, String?>?
    ): IOLEvent? {
        val eventSplit = eventname.split("\\.".toRegex(), limit = 2).toTypedArray()
        val eventIdentifier = eventSplit[0]
        val eventState = eventSplit[1]
        if (eventIdentifier == IOLAdvertisementEvent.eventIdentifier) {
            for (type in IOLAdvertisementEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLAdvertisementEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLAudioEvent.eventIdentifier) {
            for (type in IOLAudioEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLAudioEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLBackgroundTaskEvent.eventIdentifier) {
            for (type in IOLBackgroundTaskEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLBackgroundTaskEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLDataEvent.eventIdentifier) {
            for (type in IOLDataEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLDataEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLDeviceOrientationEvent.eventIdentifier) {
            for (type in IOLDeviceOrientationEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLDeviceOrientationEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLDocumentEvent.eventIdentifier) {
            for (type in IOLDocumentEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLDocumentEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLDownloadEvent.eventIdentifier) {
            for (type in IOLDownloadEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLDownloadEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLGameEvent.eventIdentifier) {
            for (type in IOLGameEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLGameEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLGestureEvent.eventIdentifier) {
            for (type in IOLGestureEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLGestureEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLHardwareButtonEvent.eventIdentifier) {
            for (type in IOLHardwareButtonEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLHardwareButtonEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLIAPEvent.eventIdentifier) {
            for (type in IOLIAPEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLIAPEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLLoginEvent.eventIdentifier) {
            for (type in IOLLoginEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLLoginEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLOpenAppEvent.eventIdentifier) {
            for (type in IOLOpenAppEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLOpenAppEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLPushEvent.eventIdentifier) {
            for (type in IOLPushEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLPushEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLUploadEvent.eventIdentifier) {
            for (type in IOLUploadEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLUploadEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLViewEvent.eventIdentifier) {
            for (type in IOLViewEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLViewEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLVideoEvent.eventIdentifier) {
            for (type in IOLVideoEventType.values()) {
                if (type.state.equals(eventState, ignoreCase = true)) {
                    return IOLVideoEvent(type, category, comment, customParams)
                }
            }
        } else if (eventIdentifier == IOLCustomEvent.eventIdentifier) {
            return IOLCustomEvent(eventState, category, comment, customParams)
        } else {
            Log.e("OEWA EventHelper", "Could not create OEWA event from identifier  Has to be one of the predefined types: advertisement, audio, backgroundTask, cstom, data, deviceOrientation, document, download, game, gesture, hardwareButton, iAP, login, openApp, push, upload, video, view")
        }

        Log.e("OEWA EventHelper", "unknown state for identifier: $eventname")
        return null
    }
}