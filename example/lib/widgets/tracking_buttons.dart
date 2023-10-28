import 'package:flutter/material.dart';
import 'package:flutter_oewa/flutter_oewa.dart';

class TrackingButtons extends StatelessWidget {
  const TrackingButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Log a page view
        OutlinedButton(
          onPressed: () {
            Oewa.logEvent(
              OewaViewEvent.appeared(category: 'article'),
            );
          },
          child: const Text('Track View'),
        ),
        // Log a data event
        OutlinedButton(
          onPressed: () {
            Oewa.logEvent(
              OewaDataEvent.refresh(
                category: 'newsstream',
                comment: 'Test comment',
                customParams: {
                  'test': 'test',
                },
              ),
            );
          },
          child: const Text('Track Data Event'),
        ),
        // Log a video event
        OutlinedButton(
          onPressed: () {
            Oewa.logEvent(
              OewaVideoEvent.play(
                category: 'news_tv',
              ),
            );
          },
          child: const Text('Track Video Event'),
        ),
      ],
    );
  }
}
