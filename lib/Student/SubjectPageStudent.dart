import 'package:flutter/material.dart';
import 'package:flutter_school_app/Student/MathsPageStudent.dart';
import 'package:flutter_school_app/Student/SciencePageStudent.dart';

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
        title: Text('My Subjects'),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                      // Navigate to the corresponding subject's page when the button is tapped
                      switch (subjects[index]) {
                        case 'Maths':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MathsPageStudent(),
                            ),
                          );
                          break;
                        case 'Science':
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SciencePageStudent(),
                            ),
                          );
                          break;
                        // Add cases for other subjects here
                      }
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
