import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_school_app/Login.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({Key? key});

  @override
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
  late final CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _calendarController.view = CalendarView.schedule;
    _calendarController.selectedDate = DateTime.now(); // Set selected date to the current date
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            padding: EdgeInsets.only(bottom: 5), // Logout button
            iconSize: 28,
            onPressed: () {
              _showLogoutConfirmationDialog(context);
              // Add your logout button action here
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 50,
            padding: EdgeInsets.only(right: 15, bottom: 6),
            // Profile button
            onPressed: () {
              // Add your profile button action here
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Combine "Welcome back" and "student name" texts in a Column
            Column(
              children: [
                Text(
                  'Welcome back \n"student Name"', // Combine both texts
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40), // Increased the height of SizedBox
              ],
            ),
            // Second column for the calendar
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Display calendar
              children: <Widget>[
                Container(
                  height: 410, // Adjust the height as needed
                  width: 400, // Adjust the width as needed
                  child: SfCalendar(
                    controller: _calendarController,
                    dataSource: _getDataSource(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Display appointments
  _DataSource _getDataSource() {
    final List<Appointment> appointments = <Appointment>[
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 8, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0), // 10:00 AM
        subject: 'Science',
        color: Colors.red,
      ),
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 11, 0), // 1:00 AM of the next day
        subject: 'Math',
        color: const Color(0xFFf527318),
      ),
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 13, 0), // 1:00 AM of the next day
        subject: 'English',
        color: const Color(0xFFfb21f66),
      ),
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 13, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0),
        subject: 'History',
        color: const Color(0xFFf3282b8),
      ),
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 15, 0),
        subject: 'Physics',
        color: const Color(0xFFf2a7886),
      ),
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0),
        subject: 'Chemistry',
        color: Colors.lightBlueAccent,
      ),
    ];
    return _DataSource(appointments);
  }
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Logout Confirmation'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Add your logout logic here
              Navigator.of(context).pop(); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              ); // Navigate to the login screen
            },
            child: Text('Logout'),
          ),
        ],
      );
    },
  );
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
