import 'package:flutter/services.dart';
import 'package:flutter_oewa/flutter_oewa.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterOewa platform = MethodChannelFlutterOewa();
  const MethodChannel channel = MethodChannel('flutter_oewa');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 'true';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('initIOLSession', () async {
    expect(await platform.initIOLSession('test', true), 'true');
  });

  test('startSession', () async {
    expect(await platform.startSession(), 'true');
  });

  test('terminateSession', () async {
    expect(await platform.terminateSession(), 'true');
  });

  test('sendLoggedEvents', () async {
    expect(await platform.sendLoggedEvents(), 'true');
  });

  test('setDebugModeEnabled', () async {
    expect(await platform.setDebugModeEnabled(true), 'true');
  });

  test('logEvent', () async {
    expect(await platform.logEvent(OewaViewEvent.appeared()), 'true');
  });
}
