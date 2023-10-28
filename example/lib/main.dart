import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_oewa/flutter_oewa.dart';
import 'package:flutter_oewa_example/widgets/tracking_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    initOewa();
  }

  bool _optOut = false;

  // Initializes our OEWA tracking session
  Future<void> initOewa() async {
    // defines your unique vendor id (you get this from your OEWA account)
    const offerIdentifier = 'at_a_ttcom';

    // defines whether debug messages should be logged for development
    const debugMode = true;

    // start the session
    await Oewa.initIOLSession(
      offerIdentifier,
      debugMode: debugMode,

      optOutState: false,
      privacyMode: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Center(
                child: Text(
                  'Check the logs to see whether requests go out or not!',
                ),
              ),

              // Demo buttons to log events
              const TrackingButtons(),

              // seperator
              const SizedBox(height: 100),

              // Opt out button
              if (_optOut == false)
                ElevatedButton(
                  onPressed: () async {
                    // opt out
                    await Oewa.optOut();

                    final newOptOutState = await Oewa.getOptOutStatus();

                    // set the state just to update ui
                    setState(() {
                      _optOut = newOptOutState;
                    });
                  },
                  child: const Text('Opt out'),
                ),

              // Opt in button
              if (_optOut == true)
                ElevatedButton(
                  onPressed: () async {
                    await Oewa.optIn();

                    final newOptOutState = await Oewa.getOptOutStatus();

                    // set the state just to update ui
                    setState(() {
                      _optOut = newOptOutState;
                    });
                  },
                  child: const Text('Opt in'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
