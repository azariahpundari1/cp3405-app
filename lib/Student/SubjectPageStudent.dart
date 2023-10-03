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

  // Define a list of colors for each subject
  final List<Color> subjectColors = [
    const Color(0xFFf527318).withOpacity(0.8), // Maths
    Colors.red.withOpacity(0.8), // Science
    const Color(0xFFf3282b8).withOpacity(0.8), // History
    const Color(0xFFfb21f66).withOpacity(0.8), // English
    const Color(0xfff2a7886).withOpacity(0.8), // Physics
    Colors.lightBlueAccent.withOpacity(0.8), // Chemistry
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Subjects'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0), // Add bottom padding

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
                          backgroundColor: MaterialStateProperty.all(subjectColors[index]), // Assign a color based on the index

                          minimumSize: MaterialStateProperty.all(Size(double.infinity, 80)), // Make buttons wider
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(color: Colors.black, width: 1.5),
                            ),
                          ),
                        ),
                        child: Text(
                          subjects[index],
                          style: TextStyle(fontSize: 20, color: Colors.white), // Increase font size
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
