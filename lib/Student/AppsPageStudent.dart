import 'package:flutter/material.dart';
import 'NavViewPageStudent.dart'; // Import your NavViewPageStudent page

class AppsPageStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classroom Apps'), // Set the page title
        automaticallyImplyLeading: true, // Remove the leading back button
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 1, left: 10, right: 10, bottom: 1), // Add padding to create a gap
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: classroomAppsList.length,
                itemExtent: 50.0, // Adjust this value to reduce spacing between apps
                itemBuilder: (context, index) {
                  final app = classroomAppsList[index];
                  return ListTile(
                    title: Text(
                      app.name, // App name on the left
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: app.status == AppStatus.banned
                        ? Icon(Icons.block, color: Colors.red) // Banned
                        : app.status == AppStatus.timer
                            ? Icon(Icons.access_time, color: Colors.blue) // Timer
                            : Icon(Icons.check_circle, color: Colors.green), // Allowed
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                Container(
                  width: double.infinity, // Full width of the screen
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    border: Border.all(color: Colors.green, width: 2.0), // Red border
                    // Green box
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Adhering to phone rules in class',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '+10 points',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity, // Full width of the screen
                  decoration: BoxDecoration(
                    color: Colors.yellow.withOpacity(0.2),
                    border: Border.all(color: Colors.yellow.shade600, width: 2.0), // Red border
                    // Yellow box
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Minor infractions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '-5 points',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: double.infinity, // Full width of the screen
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    border: Border.all(color: Colors.red, width: 2.0), // Red border
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Major infraction',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '-10 points',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

class ClassroomApp {
  final String name;
  final AppStatus status;

  ClassroomApp({required this.name, required this.status});
}

enum AppStatus {
  allowed,
  banned,
  timer,
}

final List<ClassroomApp> classroomAppsList = [
  ClassroomApp(name: 'Facebook', status: AppStatus.banned),
  ClassroomApp(name: 'Snapchat', status: AppStatus.banned),
  ClassroomApp(name: 'Instagram', status: AppStatus.banned),
  ClassroomApp(name: 'Kahoot!', status: AppStatus.allowed),
  ClassroomApp(name: 'Youtube', status: AppStatus.timer),
  ClassroomApp(name: 'Calculator', status: AppStatus.allowed),
  ClassroomApp(name: 'Google Chrome', status: AppStatus.timer),

  // Add more apps to the list
];
