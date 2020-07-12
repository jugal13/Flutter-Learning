
import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: CountdownClock(),
    );
  }
}

class CountdownClock extends StatefulWidget {
  @override
  _CountdownClockState createState() => _CountdownClockState();
}

class _CountdownClockState extends State<CountdownClock> {
  DateTime _selectedDate;
  TimeOfDay _selectedTime;

  DateTime _finalDate;

  int remainingTime;
  int _seconds;
  int _minutes;
  int _hours;
  int _days;

  Timer _currentTimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        onPressed: () async {
                          _selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(
                              3000,
                            ),
                          );
                          setState(() {});
                          if (_selectedDate != null && _selectedTime != null) {
                            refreshData();
                          } else {
                            clearData();
                          }
                        },
                        child: Text(
                          _selectedDate == null
                              ? 'Select Date'
                              : _getSelectedDate,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          _selectedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          setState(() {});
                          if (_selectedDate != null && _selectedTime != null) {
                            refreshData();
                          } else {
                            clearData();
                          }
                        },
                        child: Text(
                          _selectedTime == null
                              ? 'Select Time'
                              : _getSelectedTime,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Countdown Clock',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildColumn(
                        context,
                        'Days',
                        _days ?? 0,
                      ),
                      _buildColumn(
                        context,
                        'Hours',
                        _hours ?? 0,
                      ),
                      _buildColumn(
                        context,
                        'Minutes',
                        _minutes ?? 0,
                      ),
                      _buildColumn(
                        context,
                        'Seconds',
                        _seconds ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get _getSelectedDate {
    return '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
  }

  String get _getSelectedTime {
    return '${_selectedTime.hour}:${_selectedTime.minute}';
  }

  Widget _buildColumn(
    BuildContext context,
    String title,
    int body,
  ) {
    return Column(
      children: [
        Text(
          body.toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.blue,
              ),
        ),
      ],
    );
  }

  void refreshData() {
    _finalDate = DateTime(
      _selectedDate.year,
      _selectedDate.month,
      _selectedDate.day,
      _selectedTime.hour,
      _selectedTime.minute,
    );
    updateDate();

    _currentTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        updateDate();
      },
    );
  }

  void updateDate() {
    DateTime _currentDate = DateTime.now();
    Duration _difference = _finalDate.difference(_currentDate);
    _seconds = _difference.inSeconds;
    _minutes = (_seconds / 60).floor();
    _hours = (_minutes / 60).floor();
    _days = (_hours / 24).floor();

    _seconds = _seconds % 60;
    _minutes = _minutes % 60;
    _hours = _hours % 24;
    setState(() {});
  }

  void clearData() {
    if (_currentTimer != null) {
      _currentTimer.cancel();
    }
    _seconds = null;
    _minutes = null;
    _hours = null;
    _days = null;
    setState(() {});
  }
}

