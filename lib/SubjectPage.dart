import 'package:flutter/material.dart';

class SubjectPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectPage> {
  final List<String> subjects = [
    'Math',
    'Science',
    'History',
    'English',
    'Physics',
    'Chemistry',
  ];

  String selectedSubject = ''; // To store the selected subject

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSubject = subjects[index];
                      });
                    },
                    child: Text(subjects[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
