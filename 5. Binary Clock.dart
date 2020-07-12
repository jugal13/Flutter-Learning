import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: BinaryClock(),
    );
  }
}

class BinaryClock extends StatefulWidget {
  @override
  _BinaryClockState createState() => _BinaryClockState();
}

class _BinaryClockState extends State<BinaryClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DigitalTimer(),
              SizedBox(
                height: 10,
              ),
              BinaryTimer(),
            ],
          ),
        ),
      ),
    );
  }
}

class DigitalTimer extends StatefulWidget {
  @override
  _DigitalTimerState createState() => _DigitalTimerState();
}

class _DigitalTimerState extends State<DigitalTimer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  DateTime _currentTime;
  String _currentHour;
  String _currentMinute;
  String _currentSecond;

  @override
  void initState() {
    super.initState();
    refreshData();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animationController.repeat(
      reverse: true,
    );
    Timer.periodic(
        Duration(
          seconds: 1,
        ), (timer) {
      refreshData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildContainer(_currentHour),
            _buildSeparator,
            _buildContainer(_currentMinute),
            _buildSeparator,
            _buildContainer(_currentSecond),
          ],
        ),
      ),
    );
  }

  void refreshData() {
    _currentTime = DateTime.now();
    _currentHour = '${_currentTime.hour}'.padLeft(2, '0');
    _currentMinute = '${_currentTime.minute}'.padLeft(2, '0');
    _currentSecond = '${_currentTime.second}'.padLeft(2, '0');
  }

  Widget _buildContainer(String body) {
    return Container(
      width: 50,
      child: Text(
        body,
        style: TextStyle(
          fontSize: 40,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget get _buildSeparator {
    return FadeTransition(
      opacity: _animationController,
      child: Container(
        width: 15,
        child: Text(
          ':',
          style: TextStyle(fontSize: 40, color: Colors.blue),
        ),
      ),
    );
  }
}

class BinaryTimer extends StatefulWidget {
  @override
  _BinaryTimerState createState() => _BinaryTimerState();
}

class _BinaryTimerState extends State<BinaryTimer> {
  DateTime _currentTime;
  String _currentHour;
  String _currentMinute;
  String _currentSecond;

  @override
  void initState() {
    super.initState();
    refreshData();
    Timer.periodic(Duration(seconds: 1), (timer) {
      refreshData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard(_currentHour),
        _buildCard(_currentMinute),
        _buildCard(_currentSecond),
      ],
    );
  }

  void refreshData() {
    _currentTime = DateTime.now();
    _currentHour = _currentTime.hour.toRadixString(2).padLeft(6, '0');
    _currentMinute = _currentTime.minute.toRadixString(2).padLeft(6, '0');
    _currentSecond = _currentTime.second.toRadixString(2).padLeft(6, '0');
  }

  Widget _buildCard(String currentRow) {
    final List<bool> _clockRow = currentRow
        .split('')
        .map(
          (item) => item == '1',
        )
        .toList();
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: _clockRow.map(
            (item) {
              return Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: item ? Colors.blue : Colors.white,
                ),
                margin: EdgeInsets.all(8),
                height: 30,
                width: 30,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

