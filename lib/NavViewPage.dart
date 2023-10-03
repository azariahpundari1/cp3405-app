import 'package:flutter/material.dart';
import 'package:flutter_school_app/HomePage.dart';
import 'package:flutter_school_app/SettingPage.dart';
import 'package:flutter_school_app/SubjectPage.dart';

class NavViewPage extends StatefulWidget {
  final int initialPage; // Add the initialPage parameter

  NavViewPage({required this.initialPage});

  @override
  _NavViewPageState createState() => _NavViewPageState();
}

class _NavViewPageState extends State<NavViewPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<Widget> pages = [
    HomePage(),
    SubjectPage(),
    SettingsPage(),
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
