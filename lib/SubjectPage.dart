import 'package:flutter/material.dart';
import 'package:flutter_school_app/MathsPage.dart';

class SubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Subjects'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SubjectLabel(
              label: 'Maths',
              color: Colors.black,
            ),

            SizedBox(height: 16.0), // Add spacing between label and buttons
            SubjectButton(
              label: 'Maths Year 10 - 10A',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MathsPage(),
                  ),
                );
              },
              color: const Color(0xFFf527318),
            ),
            SizedBox(height: 16.0), // Add spacing between buttons
            SubjectButton(
              label: 'Maths Year 8 - 8B',
              onTap: () {},
              color: const Color(0xFFf527318),
            ),
            SizedBox(height: 50.0), // Add spacing between buttons
            SubjectLabel(label: 'Science Subjects', color: Colors.black),
            SizedBox(height: 16.0), // Add spacing between label and buttons
            SubjectButton(
              label: 'Science Year 9 - 9A',
              onTap: () {},
              color: Colors.red,
            ),
            SizedBox(height: 16.0), // Add spacing between buttons
            SubjectButton(
              label: 'Science Year 12 - 12A',
              onTap: () {},
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class SubjectLabel extends StatelessWidget {
  final String label;
  final Color color;

  SubjectLabel({
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class SubjectButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;

  SubjectButton({
    required this.label,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        minimumSize: MaterialStateProperty.all(Size(double.infinity, 80)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(color: Colors.black, width: 1.5),
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
