import 'package:flutter/widgets.dart';
import 'package:flutter_oewa/flutter_oewa.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockFlutterOewaPlatformPositive
    with MockPlatformInterfaceMixin
    implements FlutterOewaPlatform {
  @override
  Future<String?> initIOLSession(String offerIdentifier,
          [bool debugMode = false]) =>
      Future.value('true');

  @override
  Future<String?> startSession(String? offerIdentifier) => Future.value('true');

  @override
  Future<String?> terminateSession() => Future.value('true');

  @override
  Future<String?> sendLoggedEvents() => Future.value('true');

  @override
  Future<String?> setDebugModeEnabled(bool enable) => Future.value('true');

  @override
  Future<String?> logEvent(OewaEvent event) => Future.value('true');
}

class MockFlutterOewaPlatformNegative
    with MockPlatformInterfaceMixin
    implements FlutterOewaPlatform {
  @override
  Future<String?> initIOLSession(String offerIdentifier,
          [bool debugMode = false]) =>
      Future.value('false');

  @override
  Future<String?> startSession(String? offerIdentifier) =>
      Future.value('false');

  @override
  Future<String?> terminateSession() => Future.value('false');

  @override
  Future<String?> sendLoggedEvents() => Future.value('false');

  @override
  Future<String?> setDebugModeEnabled(bool enable) => Future.value('false');

  @override
  Future<String?> logEvent(OewaEvent event) => Future.value('false');
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  final FlutterOewaPlatform initialPlatform = FlutterOewaPlatform.instance;

  group('Positive PlatformChannel results', () {
    test('$MethodChannelFlutterOewa is the default instance', () {
      expect(initialPlatform, isInstanceOf<MethodChannelFlutterOewa>());
    });

    // Test whether SDK method responses are forwarded correctly if positive
    test('getPlatformVersion returns a positive result', () async {
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.initIOLSession('test'), true);
    });

    test('startSession returns a positive result', () async {
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.startSession('test'), true);
    });

    test('terminateSession returns a positive result', () async {
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.terminateSession(), true);
    });

    test('sendLoggedEvents returns a positive result', () async {
      MockFlutterOewaPlatformNegative fakePlatform =
          MockFlutterOewaPlatformNegative();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.sendLoggedEvents(), false);
    });

    test('setDebugModeEnabled returns a positive result', () async {
      MockFlutterOewaPlatformNegative fakePlatform =
          MockFlutterOewaPlatformNegative();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.setDebugModeEnabled(true), false);
    });

    test('logEvent returns a positive result', () async {
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.logEvent(OewaViewEvent.appeared()), true);
    });
  });

  // Test whether SDK method responses are forwarded correctly if negative
  group('Negative PlatformChannel results', () {
    test('getPlatformVersion returns a negative result', () async {
      MockFlutterOewaPlatformNegative fakePlatform =
          MockFlutterOewaPlatformNegative();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.initIOLSession('test'), false);
    });

    test('startSession returns a negative result', () async {
      MockFlutterOewaPlatformNegative fakePlatform =
          MockFlutterOewaPlatformNegative();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.startSession('test'), false);
    });

    test('terminateSession returns a negative result', () async {
      MockFlutterOewaPlatformNegative fakePlatform =
          MockFlutterOewaPlatformNegative();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.terminateSession(), false);
    });

    test('sendLoggedEvents returns a negative result', () async {
      MockFlutterOewaPlatformNegative fakePlatform =
          MockFlutterOewaPlatformNegative();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.sendLoggedEvents(), false);
    });

    test('setDebugModeEnabled returns a negative result', () async {
      MockFlutterOewaPlatformNegative fakePlatform =
          MockFlutterOewaPlatformNegative();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.setDebugModeEnabled(true), false);
    });

    test('logEvent returns a negative result', () async {
      MockFlutterOewaPlatformNegative fakePlatform =
          MockFlutterOewaPlatformNegative();
      FlutterOewaPlatform.instance = fakePlatform;

      expect(await Oewa.logEvent(OewaViewEvent.appeared()), false);
    });
  });

  // Test whether behavior is correct when opted in or out
  group('OptOut Methods', () {
    // initIOLSession
    test('session is created if no optOut status defined', () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // session is created successfully
      expect(await Oewa.initIOLSession('test'), true);
    });

    test('session is not created if optOut status is true', () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // opt out
      await Oewa.optOut();

      // session is created successfully
      expect(await Oewa.initIOLSession('test'), false);
    });

    test(
        'session with default value don\'t track by default is not initialized',
        () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // session is created successfully
      expect(await Oewa.initIOLSession('test', optOutState: true), false);

      // check if opt out status is true
      expect(await Oewa.getOptOutStatus(), true);

      // make sure tracking doesn't track either
      expect(await Oewa.logEvent(OewaViewEvent.appeared()), false);
    });

    // track events
    test('event is tracked if no optOut status defined', () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // event is tracked successfully
      expect(await Oewa.logEvent(OewaViewEvent.appeared()), true);
    });

    test('event is not tracked if optOut status is true', () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // opt out
      await Oewa.optOut();

      // event is tracked successfully
      expect(await Oewa.logEvent(OewaViewEvent.appeared()), false);
    });

    test('event is tracked again if opted out and then opted in again',
        () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // opt out
      await Oewa.optOut();

      // event is tracked successfully
      expect(await Oewa.logEvent(OewaViewEvent.appeared()), false);

      // opt in again
      await Oewa.optIn('test');

      // event is tracked successfully
      expect(await Oewa.logEvent(OewaViewEvent.appeared()), true);
    });

    test('getOptOutStatus returns correct status', () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // by default the status should be false
      expect(await Oewa.getOptOutStatus(), false);

      // now opt out and it should opted out now
      await Oewa.optOut();
      expect(await Oewa.getOptOutStatus(), true);

      // now opt in again and check
      await Oewa.optIn('test');
      expect(await Oewa.getOptOutStatus(), false);
    });
  });

  // Test behavior without privacyMode
  group('No privacyMode', () {
    test(
        'Make sure enabled privacy mode works and blocks session start and logging successfully',
        () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // create session without privacy mode
      final sessionStarted = await Oewa.initIOLSession(
        'test',
        privacyMode: true,
        optOutState: true,
      );

      // session should have been started successful
      expect(sessionStarted, false);

      // logging an event should also work
      expect(await Oewa.logEvent(OewaViewEvent.appeared(), privacyMode: true),
          false);
    });

    test(
        'Trying to opt out of "no privacy" initiated session, works normally and is not blocked',
        () async {
      SharedPreferences.setMockInitialValues({});
      MockFlutterOewaPlatformPositive fakePlatform =
          MockFlutterOewaPlatformPositive();
      FlutterOewaPlatform.instance = fakePlatform;

      // create session without privacy mode
      final sessionStarted =
          await Oewa.initIOLSession('test', privacyMode: false);

      // session should have been started successful
      expect(sessionStarted, true);

      // opt out
      await Oewa.optOut();

      // logging an event should also work
      expect(await Oewa.logEvent(OewaViewEvent.appeared(), privacyMode: false),
          true);
    });
  });
}
