import 'package:flutter/material.dart';
import 'package:flutter_school_app/Student/NavViewPageStudent.dart';

class RewardsPageStudent extends StatelessWidget {
  final int userPoints; // User points

  // Constructor to receive user points
  RewardsPageStudent({required this.userPoints});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Rewards'),
        backgroundColor: Colors.white,
        actions: [
          // Display user points in the app bar
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Icon(Icons.stars, color: Colors.yellow[600]),
                SizedBox(width: 4.0),
                Text(
                  '$userPoints Points',
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // List of recent points earned
          _buildSection(
            title: 'Recent Points Earned',
            borderColor: Colors.blue, // Green border for plus points
            children: [
              _buildPointItem(
                description: 'Earned 10 points for attending Math class on 2023-09-15',
                points: 10,
              ),
              _buildPointItem(
                description: 'Earned 5 points for submitting homework on 2023-09-14',
                points: 10,
              ),
              _buildPointItem(
                description: 'Deducted 5 Points for minor app infraction 2023-09-13',
                points: -5,
              ),
              // Add more recent point items here
            ],
          ),
          // List of ways to earn points
          SizedBox(height: 8.0), // Reduce the height
          _buildSection(
            title: 'Ways to Earn Points',
            borderColor: Colors.green, // Blue border for descriptions
            children: [
              _buildPointItem(
                description: '1. Adhering to phone rules in class',
                points: 10,
              ),
              _buildPointItem(
                description: '2. Submit homework',
                points: 10,
              ),
              _buildPointItem(
                description: '3. Participate in classroom activities',
                points: 10,
              ),
              // Add more ways to earn points here
            ],
          ),
          // List of ways to lose points
          SizedBox(height: 8.0), // Reduce the height

          _buildSection(
            title: 'Ways to Lose Points',
            borderColor: Colors.red, // Red border for minus points

            children: [
              _buildPointItem(
                description: '1. Minor App infringements',
                points: -5,
              ),
              _buildPointItem(
                description: '2. Major App infringements',
                points: -10,
              ),
              _buildPointItem(
                description: '3. Late to class',
                points: -5,
              ),
              _buildPointItem(
                description: '4. Not completing Homework',
                points: -10,
              ),
              // Add more ways to lose points here
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the action for the "Go to Rewards Shop" button
        },
        backgroundColor: Colors.yellow[600],
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
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

  // Helper method to build a section with a border
  Widget _buildSection({
    required String title,
    required Color borderColor,
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.blue[50]?.withOpacity(0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          ...children,
        ],
      ),
    );
  }

  // Helper method to build a recent point item
  Widget _buildPointItem({
    required String description,
    required int points,
  }) {
    Color pointColor = points >= 0 ? Colors.green : Colors.red; // Color based on points
    return ListTile(
      title: Text(
        description,
        style: TextStyle(
          color: pointColor,
          fontSize: 14.0,
          height: 1,
        ),
      ),
      trailing: Text(
        '$points points',
        style: TextStyle(
          color: pointColor,
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
    );
  }
}
