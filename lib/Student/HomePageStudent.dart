// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomePageStudent extends StatefulWidget {
  const HomePageStudent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageStudentState createState() => _HomePageStudentState();
}

class _HomePageStudentState extends State<HomePageStudent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Main Screen'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),

            // second column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // Display calendar
              children: <Widget>[
                SfCalendar(
                  view: CalendarView.schedule,
                  dataSource: _getDataSource(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Display appointments
  _DataSource _getDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.parse('2023-09-27 08:00:04Z'),
      // startTime: DateTime.now().add(const Duration(hours: -2)),
      // endTime: DateTime.now().add(const Duration(hours: -1)),
      endTime: DateTime.parse('2023-09-27 09:55:04Z'),
      subject: 'Science',
      color: Colors.red,
    ));
    appointments.add(Appointment(
      startTime: DateTime.parse('2023-09-27 10:00:04Z'),
      endTime: DateTime.parse('2023-09-27 11:55:04Z'),
      subject: 'Math',
      color: Color(0xFFf527318),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(hours: 2)),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'English',
      color: Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(hours: 2)),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'History',
      color: Color(0xFFf3282b8),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(hours: 2)),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Physics',
      color: Color(0xFFf2a7886),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2)),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Chemistry',
      color: Colors.lightBlueAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2)),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Biology',
      color: Colors.amber,
    ));
    return _DataSource(appointments);
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
