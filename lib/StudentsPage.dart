import 'package:flutter/material.dart';

class StudentProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue, // Background color for the circle avatar
              child: Icon(
                Icons.person, // Use any icon you like
                size: 80,
                color: Colors.white, // Icon color
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Ben Dover', // Replace with the student's name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Email: ben.dover@email.com', // Replace with student's email
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                border: Border.all(color: Colors.blue, width: 2), // Blue border
                borderRadius: BorderRadius.circular(8), // Rounded edges
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    'Application Usage this class', // Application usage title
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Facebook: 0H 30M\nCalculator: 1H 0M\nKahoot!: 0H 15M', // Replace with application usage details
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Bold text
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow.withOpacity(0.2),
                  border: Border.all(color: Colors.yellow.shade600, width: 2), // Yellow border
                  borderRadius: BorderRadius.circular(8), // Rounded edges
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Points: ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '100', // Replace with student's points
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), // Bold and yellow text
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to give points to the student
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Button color
                minimumSize: Size(180, 50), // Button size
              ),
              child: Text(
                'Give Points', // Button text
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                // Add logic to give points to the student
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Button color
                minimumSize: Size(180, 50), // Button size
              ),
              child: Text(
                'Deduct Points', // Button text
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentsPage extends StatelessWidget {
  final customColor = Color.fromARGB(255, 1, 87, 155); // Custom color

  final List<String> studentNames = [
    'Ben Dover',
    'Daniel',
    'Azariah',
    'David',
    'John',
    'Joco',
    'Kiru',
    'Stephen',
    'Jase',
    'Bob',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Background color for the container
              borderRadius: BorderRadius.circular(10.0), // Rounded edges
              border: Border.all(
                color: customColor, // Border color
                width: 2.0,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.all(10), // Add margin around the container
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: customColor, // Color of the search icon
                ),
                SizedBox(width: 10), // Smaller spacing
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search', // Placeholder text for the search bar
                      border: InputBorder.none, // Remove input border
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: studentNames.length, // Number of students in the list
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      // Navigate to the student profile page only for the first student
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentProfilePage(),
                        ),
                      );
                    }
                  },
                  child: Card(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 8), // Reduced spacing
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Smaller border radius
                      side: BorderSide(
                        color: customColor, // Custom color border
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12.0), // Smaller padding
                      child: Row(
                        children: [
                          // Profile icon
                          Icon(
                            Icons.person, // Use an icon for the profile
                            size: 40.0, // Smaller icon size
                            color: customColor, // Icon color
                          ),
                          SizedBox(width: 10), // Smaller spacing
                          // Student name
                          Text(
                            studentNames[index], // Unique student names
                            style: TextStyle(
                              fontSize: 16.0, // Smaller font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
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
          // You can navigate to different pages with the corresponding index
          if (index == 0) {
            // Navigate to the Home page
          } else if (index == 1) {
            // Navigate to the Subjects page
          } else if (index == 2) {
            // Navigate to the Settings page
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StudentsPage(),
  ));
}
