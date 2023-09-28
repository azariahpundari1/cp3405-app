// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
  int _selectedSegment = 0;

  // Create a map to associate segment values with their text labels
  final Map<int, String> segmentText = {
    0: 'Yesterday',
    1: 'Today',
    2: 'Tomorrow',
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Segmented Control Example'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoSegmentedControl<int>(
              children: {
                0: const Text('Yesterday'),
                1: const Text('Today'),
                2: const Text('Tomorrow'),
              },
              groupValue: _selectedSegment,
              onValueChanged: (value) {
                setState(() {
                  _selectedSegment = value;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                'Selected Segment: ${segmentText[_selectedSegment]}'), // Display the selected text
          ],
        ),
      ),
    );
  }
}
