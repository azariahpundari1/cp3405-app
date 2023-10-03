import 'package:flutter/material.dart';
import 'package:flutter_school_app/Student/AnnouncementsPageStudent.dart';
import 'package:flutter_school_app/Student/AppsPageStudent.dart';
import 'package:flutter_school_app/Student/RewardsPageStudent.dart';
import 'NavViewPageStudent.dart';

class MathsPageStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customColor = const Color.fromARGB(255, 1, 87, 155); // Custom color
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maths 10A'),
        centerTitle: true,
        actions: const [
          // Add any actions you want in the app bar
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Year 10 Maths',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SubjectsButtons(customColor: customColor, context: context),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subject),
            label: 'Subjects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 1,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavViewPageStudent(initialPage: index),
            ),
          );
        },
      ),
    );
  }
}

class SubjectsButtons extends StatelessWidget {
  final Color customColor;
  final BuildContext context;

  SubjectsButtons({required this.customColor, required this.context});

  @override
  Widget build(BuildContext context) {
    final List<String> buttonLabels = ['Classroom Apps', 'My Rewards', 'Announcements'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttonLabels.map((label) {
        Widget destinationPage = Container();

        if (label == 'Classroom Apps') {
          destinationPage = AppsPageStudent();
        } else if (label == 'My Rewards') {
          destinationPage = RewardsPageStudent(userPoints: 100);
        } else if (label == 'Announcements') {
          destinationPage = AnnouncementsPageStudents();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0), // Increase vertical padding
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destinationPage),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(customColor),
              minimumSize: MaterialStateProperty.all(const Size(double.infinity, 80)), // Increase button height
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }
}
