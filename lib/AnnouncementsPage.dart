import 'package:flutter/material.dart';
import 'package:flutter_school_app/NavViewPage.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // List of Recent Announcements
            _buildSection(
              title: 'Recently Sent Announcements',
              children: [
                _buildAnnouncementItem(
                  title: 'Important Notice - 20/10/2023',
                  content: 'Science Room change to room 22 in building 7',
                ),
                _buildAnnouncementItem(
                  title: 'Important Notice - 18/10/2023',
                  content: 'Homework Due tommorow for Maths',
                ),
                // Add more recent announcements here
              ],
            ),

            const SizedBox(height: 16.0),

            // Compose New Announcement
            const Text(
              'Compose New Announcement',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Enter your announcement here...',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                // Handle sending the announcement
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              child: const Text(
                'Send',
                style: TextStyle(color: Colors.white),
              ),
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
        currentIndex: 1,
        onTap: (index) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => NavViewPage(initialPage: index),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5.0),
          ...children,
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem({
    required String title,
    required String content,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(content),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: AnnouncementsPage(),
  ));
}
