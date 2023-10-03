import 'package:flutter/material.dart';
import 'NavViewPageStudent.dart'; // Import your NavViewPageStudent page

class SciencePageStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Page'), // Change the title as needed
        automaticallyImplyLeading: false, // Remove the leading back button
      ),
      body: Center(
        child: Text('Science Page Content'), // Change the content as needed
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
