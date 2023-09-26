import 'package:flutter/material.dart';

class SubjectPageStudent extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectPageStudent> {
  final List<String> subjects = [
    'Maths',
    'Science',
    'History',
    'English',
    'Physics',
    'Chemistry',
  ];

  String selectedSubject = ''; // To store the selected subject

  @override
  Widget build(BuildContext context) {
    final customColor = Color.fromARGB(255, 1, 87, 155);
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
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedSubject = subjects[index];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: customColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed (255, 1, 87, 155)
                      ),
                      minimumSize: Size(150, 75),
                    ),
                    child: Text(
                      subjects[index], style: TextStyle(fontSize: 16, color: Colors.white), // Adjust font size here
                    ),
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
