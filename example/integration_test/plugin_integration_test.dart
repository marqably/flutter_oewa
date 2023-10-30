import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_oewa/flutter_oewa.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test all methods', (WidgetTester tester) async {      
    // create an oewa session
    final bool initSuccessful = await Oewa.initIOLSession('test');
    expect(initSuccessful, true);

    // change debug mode
    final bool setDebugModeSuccessful = await Oewa.setDebugModeEnabled(true);
    expect(setDebugModeSuccessful, true);

    // log a page view
    final bool logSuccessful = await Oewa.logEvent(OewaViewEvent.appeared());
    expect(logSuccessful, true);

    // force send the logged events
    final bool sendLoggedEventsSuccessful = await Oewa.sendLoggedEvents();
    expect(sendLoggedEventsSuccessful, true);

    // terminate the session
    final bool terminateSuccessful = await Oewa.terminateSession();
    expect(terminateSuccessful, true);

    // now start it again
    final bool startSuccessful = await Oewa.startSession();
    expect(startSuccessful, true);
  });

  testWidgets('Test opt out and in', (WidgetTester tester) async {
    // create an oewa session
    final bool initSuccessful = await Oewa.initIOLSession('test');
    expect(initSuccessful, true);

    // opt out
    await Oewa.optOut();

    // log a page view
    final bool logSuccessful = await Oewa.logEvent(OewaViewEvent.appeared());
    expect(logSuccessful, false);

    // opt in again
    await Oewa.optIn();

    // log a page view
    final bool logSuccessful1 = await Oewa.logEvent(OewaViewEvent.appeared());
    expect(logSuccessful1, true);
  });

  testWidgets('Test opt out by default', (WidgetTester tester) async {
    // create an oewa session
    final bool initSuccessful = await Oewa.initIOLSession(
      'test',
      optOutState: true,
    );
    expect(initSuccessful, false);

    // log a page view
    final bool logSuccessful = await Oewa.logEvent(OewaViewEvent.appeared());
    expect(logSuccessful, false);

    // opt in again
    await Oewa.optIn();

    // log a page view should now work again
    final bool logSuccessful1 = await Oewa.logEvent(OewaViewEvent.appeared());
    expect(logSuccessful1, true);
  });
}
