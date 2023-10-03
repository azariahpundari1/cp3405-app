import 'package:flutter/material.dart';
import 'package:flutter_school_app/Student/NavViewPageStudent.dart';

class AnnouncementsPageStudents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements'),
        centerTitle: true,
        actions: [
          // Add any actions you want in the app bar
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // List of announcements
            _buildAnnouncement(
              title: 'Important Notice',
              content: 'Science Room change to room 22 in building 7',
              date: 'September 20, 2023',
            ),
            _buildAnnouncement(
              title: 'Important Notice',
              content: 'Homework Due tommorow for Maths',
              date: 'September 18, 2023',
            ),
            // Add more announcements here
          ],
        ),
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
            icon: Icon(Icons.notifications), // Notifications icon for Announcements page
            label: 'Announcements', // Highlighted page
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 2, // Set the current index to 2 (Announcements)
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

  // Helper method to build an announcement item
  Widget _buildAnnouncement({
    required String title,
    required String content,
    required String date,
  }) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              content,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Date: $date',
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
