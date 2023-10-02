import 'package:flutter/material.dart';
import 'HomePageStudent.dart'; // Import your HomeScreen page
import 'SubjectPageStudent.dart'; // Import your Subjects page
import 'SettingPageStudent.dart'; // Import your Settings page

class NavViewPageStudent extends StatefulWidget {
  final int initialPage; // Add the initialPage parameter

  NavViewPageStudent({required this.initialPage});

  @override
  _NavViewPageState createState() => _NavViewPageState();
}

class _NavViewPageState extends State<NavViewPageStudent> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Widget> pages = [
    HomePageStudent(),
    SubjectPageStudent(),
    SettingsPageStudent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,

        onPageChanged: (index) {
          false;
          setState(() {
            _currentPage = index;
          });
        },
        children: pages,
        // Use the pages list
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
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
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
