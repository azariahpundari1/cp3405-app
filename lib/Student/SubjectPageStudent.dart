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
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the subject's page when the button is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubjectDetailPage(
                            subjectName: subjects[index],
                          ),
                        ),
                      );
                    },
                    child: ElevatedButton(
                      onPressed: null, // Disabled the button's onPressed
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(customColor),
                        minimumSize: MaterialStateProperty.all(Size(150, 75)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      child: Text(
                        subjects[index],
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
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

class SubjectDetailPage extends StatelessWidget {
  final String subjectName;

  SubjectDetailPage({required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
      ),
      body: Center(
        child: Text(
          'Details for $subjectName go here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
