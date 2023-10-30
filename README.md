# OEWA Flutter Plugin

This package is a wrapper around the [OEWA](https://oewa.at) Android and iOS SDKs.

The original SDK implementation instructions can be found here:

* [OEWA Android SDK](https://oewa.at/tech-support/implementation-app-android/)
* [OEWA iOS SDK](https://oewa.at/tech-support/implementation-app-ios/)

The package should provide all functionality needed to log events for OEWA in normal cases.
Also all event identifiers and their respective states have been converted to dart types for ease of use and type safety!

Apart from abstracting the native SDKs, this package also makes it easier to make your app GDPR compliant,
by implementing `optOut` and `optIn` methods, that will permanently opt out of tracking and avoid the SDKs even being called.
This is done using flutters shared preferences package to remember the opt out state. (see more under [GDPR compliant implementation](#gdpr-compliant-implementation))

## Example app

There is an [example Flutter app inside the example directory](./example/). In there you can check how you can implement this package.

## Getting Started

You use the package after adding the following to your pubspec.yaml file:

```yaml
  # before publishing fix this: add final package name
  flutter_oewa:
    path: ../packages/flutter_oewa
```

### General concept

The api of this package/OEWA is very simple.

* First you start an OEWA session (`initIOLSession`) with your `offerIdentifier`
* Then you just track events (`logEvent`) using either predefined events (see [Predefined Events](#predefined-events) ) or as a fallback, a custom event (just use `oewa_event.dart`)

The events will be batched and send asynchronous to avoid blocking anything in the app.
The sending is done automatically

### Initialize session

Before you are able to send an event, you have to initialize a session.
You can do this is in a global position (`main.dart` or a wrapper widget around your app) by calling `initIOLSession`.

```dart
import 'flutter_oewa/flutter_oewa.dart';

...

main() {
    ...

    // defines your unique vendor id (you get this from your OEWA account)
    const offerIdentifier = 'my-company-key';

    // defines whether debug messages should be logged for development
    const debugMode = true;

    // start the session
    await Oewa.initIOLSession(offerIdentifier, debugMode: debugMode);

    ...
}
```

### Log events

Now that you have a session set up, you can just log different events using the `logEvent` method.
You always have to pass a `OewaEvent` to this method.

You can do so by creating a custom `OewaEvent` or (and this is highly recommended) by using one of the predefined event classes. (see [Predefined Events](#predefined-events) )

```dart
import 'flutter_oewa/flutter_oewa.dart';

...

// track a simple page view
Oewa.logEvent(
    OewaViewEvent.appeared(category: 'article'),
);

// track a page view with more parameters
Oewa.logEvent(
    OewaViewEvent.appeared(
        category: 'article',
        comment: 'this is a comment',
        customParams: {
            'articleId': 3,
            'slug': 'my-fancy-article',
        },
    ),
);

// track a video events
Oewa.logEvent(
    OewaVideovent.play(
        category: 'article',
        customParams: {
            'video': 'youtube.com/xxxxxx',
        },
    ),
);
Oewa.logEvent(
    OewaVideovent.pause(
        category: 'article',
        customParams: {
            'video': 'youtube.com/xxxxxx',
        },
    ),
);


...
// see "Predefined Events" below for more event types to use
...

// track a custom event
Oewa.logEvent(
    OewaEvent(
        // defines the main class (in predefined events this is the class name. i.e: video, view, download, open_app, ...)
        identifier: 'in_app_browser',

        // what action happened?
        state: 'opened',

        // other params
        category: 'ugc',
        customParams: {
            'url': 'https://www.test.at',
        },
    ),
);
```

#### Predefined Events

| Area                       | Dart Type                  | Available States                                                 |
| -------------------------- | -------------------------- | ---------------------------------------------------------------- |
| Advertisement              | OewaAdvertisementEvent     | open, close                                                      |
| Audio                      | OewaAudioEvent             | play, pause, stop, next, previous, replay, seekBack, seekForward |
| BackgroundTask             | OewaBackgroundTaskEvent    | start, end                                                       |
| Data                       | OewaDataEvent              | cancelled, refresh, succeeded, failed                            |
| DeviceOrientation          | OewaDeviceOrientationEvent | changed                                                          |
| Download                   | OewaDownloadEvent          | cancelled, start, succeeded, failed                              |
| Game                       | OewaGameEvent              | action, started, finished, won, lost, highscore, achievement     |
| Gesture                    | OewaGestureEvent           | shake                                                            |
| HardwareButton             | OewaHardwareButtonEvent    | pushed                                                           |
| IAP                        | OewaIAPEvent               | started, finished, cancelled                                     |
| Login                      | OewaLoginEvent             | succeeded, failed, logout                                        |
| OpenApp                    | OewaOpenAppEvent           | maps, other                                                      |
| Push                       | OewaPushEvent              | received                                                         |
| Upload                     | OewaUploadEvent            | cancelled, start, succeeded, failed                              |
| Video                      | OewaVideoEvent             | play, pause, stop, next, previous, replay, seekBack, seekForward |
| View                       | OewaViewEvent              | appeared, refreshed, disappeared                                 |

### Debug Mode

While you are developing you can use the debugMode to get detailed logging from the library.
You can either enable it when initializing the session or using `setDebugModeEnabled`. (default is disabled)

```dart
import 'flutter_oewa/flutter_oewa.dart';

...

const bool enabled = true;

Oewa.setDebugModeEnabled(enabled);
```

### Force sending of events

Events are batched and sent async by default automatically. So usually you don't need to do anything apart from `logEvent`.
Sometimes you might want to force all tracked events to be transfered immediately. You can do that using `sendLoggedEvents`.

```dart
import 'flutter_oewa/flutter_oewa.dart';

...

Oewa.sendLoggedEvents();
```

### Terminate a session

The active IOLib session can be terminated explicitly. This facilitates an opt-out during the app runtime. The data collected up to that point is discarded and will not be sent.
You can do that using `terminateSession`.

```dart
import 'flutter_oewa/flutter_oewa.dart';

...initIOLSession

Oewa.terminateSession();
```

### Start a session

If the active session of the IOLib was terminated explicitly, it can be re-started at any time with `startSession(String offerIdentifier)`. Re-initialisation is not necessary.

```dart
import 'flutter_oewa/flutter_oewa.dart';

...

Oewa.startSession(String offerIdentifier);
```

## GDPR compliant implementation

Apart from abstracting the native SDKs, this package also makes it easier to make your app GDPR compliant,
by implementing `optOut` and `optIn` methods, that will permanently opt out of tracking and avoid the SDKs even being called.
This is done using flutters shared preferences package to remember the opt out state. (see more under [GDPR compliant implementation](#gdpr-compliant-implementation))

This way you can just implement all methods without having to think of a global state for checks.
Just call the `Oewa.initIOLSession(offerIdentifier, debugMode);` method and then track events.

Whenever your user opts out of tracking (either in your CMP/"Cookie" dialog or in your settings) you only need to call `Oewa.optOut()` once and the plugin makes sure, that the current tracking session is terminated and no further events are forwarded to OEWA.

As soon as the user wants to opt in again, you can just call `Oewa.optIn()` and tracking starts again.

### Opt out

Call `Owea.optOut()` to opt out of tracking. This setting will be remembered and also kept throughout restarts, because it is saved in shared_preferences.

All events, that have not been sent to the servers, will be canceled as well. (`Oewa.terminateSession()` is called under the hood)

```dart
Oewa.optOut();
```

### Opt in

If the user wants to enable tracking again, you can reenable it again using `Owea.optIn()`.
A new session will be started inside of it.

```dart
Oewa.optIn();
```

### Get current opt Out state

In case you need to know whether the user is opted in or not, you can use `Owea.getOptOutStatus()`.

```dart
Oewa.getOptOutStatus();
```

### Start opted in or opted out by default

If you want to start a session in opted out mode and only want it to be enabled, when the user manually accepts it, you can just set the `optOutState` in the `initIOLSession` method to true.

In this case, the opt out info will be saved, before initializing OEWA.

P.S: We highly recommend using this method to make sure the user explicitly gives consent and thereby no data is sent, unless the user really confirms.

```dart
    // defines your unique vendor id (you get this from your OEWA account)
    const offerIdentifier = 'my-company-key';

    // start the session
    await Oewa.initIOLSession(
        offerIdentifier, 
        debugMode: true,

        // this will set the opt out state and tell the library to intiialize, but only really start the session, when the `optIn` was called 
        optOutState: true,
    );
```

### Avoid built in privacy/opt-out functionality

In case you don't need opt out at all or you built it yourself, you might want to disable the opt out checks, built into this library.
You can easily do that, by passing `privacyMode: false` to `initIOLSession` and `logEvent`.

This way the logic will just be ignored and you can implement everything the way you want it.

```dart
    // start the session
    await Oewa.initIOLSession(
        offerIdentifier,

        // this property tells the method to ignore optOut checks
        privacyMode: false,
    );
```

```dart
    // tracking events
    await Oewa.logEvent(
        OewaVideovent.appeared(),

        // this property tells the method to ignore optOut checks
        privacyMode: false,
    );
```
