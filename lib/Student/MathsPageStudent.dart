import 'package:flutter/material.dart';
import 'package:flutter_school_app/Student/AppsPageStudent.dart';
import 'package:flutter_school_app/Student/RewardsPageStudent.dart';
// import 'package:flutter_school_app/Student/AnnouncementsPageStudent.dart'; // Import your AnnouncementsPageStudent page
import 'NavViewPageStudent.dart'; // Import your NavViewPageStudent page

class MathsPageStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customColor = Color.fromARGB(255, 1, 87, 155); // Custom color
    return Scaffold(
      appBar: AppBar(
        title: Text('Maths Page'), // Change the title as needed
        automaticallyImplyLeading: false, // Remove the leading back button
      ),
      body: Column(
        children: [
          Text('Maths Page Content'), // Change the content as needed
          SizedBox(height: 20), // Add spacing between content and buttons
          SubjectsButtons(customColor: customColor, context: context), // Display the buttons with custom color
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Add your navigation bar items here
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
        currentIndex: 1, // Set the current index to 1 (Subjects)
        // Add your navigation bar logic here
        onTap: (index) {
          // Handle navigation here based on the index
          // You can navigate to the NavViewPageStudent with the corresponding index
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
  final Color customColor; // Custom color
  final BuildContext context;

  SubjectsButtons({required this.customColor, required this.context}); // Constructor

  @override
  Widget build(BuildContext context) {
    final List<String> buttonLabels = ['Classroom Apps', 'My Rewards', 'Announcements']; // Button labels

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttonLabels.map((label) {
        Widget destinationPage = Container(); // Default value

        // Determine the destination page based on the button label
        if (label == 'Classroom Apps') {
          destinationPage = AppsPageStudent();
        } else if (label == 'My Rewards') {
          destinationPage = RewardsPageStudent(
            userPoints: 100,
          );
        } else if (label == 'Announcements') {
          destinationPage = RewardsPageStudent(
            userPoints: 0,
          );
        }

        return Padding(
          padding: const EdgeInsets.all(8.0), // Add spacing between buttons
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => destinationPage),
              );
              // Handle the action for the button
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(customColor), // Use custom color
              minimumSize: MaterialStateProperty.all(Size(double.infinity, 75)), // Make the button as wide as the screen
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Add rounded edges
                ),
              ),
            ),
            child: Text(
              label, // Use the button label
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }
}
