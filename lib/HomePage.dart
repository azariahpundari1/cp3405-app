import 'package:flutter/material.dart';
import 'package:flutter_school_app/Login.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePage> {
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
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue[900]), // Set the icon color to black

        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            padding: const EdgeInsets.only(bottom: 5), // Logout button
            iconSize: 28,
            onPressed: () {
              _showLogoutConfirmationDialog(context);
              // Add your logout button action here
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 50,
            padding: const EdgeInsets.only(right: 15, bottom: 6),
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
            const Column(
              children: [
                Text(
                  ' Welcome back\n"Teacher Name"', // Combine both texts
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40), // Increased the height of SizedBox
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
        subject: 'Science Year 9 - 9A',
        color: Colors.red,
      ),
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 10, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0), // 1:00 AM of the next day
        subject: 'Math Year 10 - 10A',
        color: const Color(0xFFf527318),
      ),
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 15, 0), // 1:00 AM of the next day
        subject: 'Science Year 12 - 12A',
        color: Colors.red,
      ),
      Appointment(
        startTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0), // 8:00 AM
        endTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 14, 0),
        subject: 'Maths Year 8 - 8A',
        color: const Color(0xFFf527318),
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
        title: const Text('Logout Confirmation'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
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
            child: const Text('Logout'),
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
