import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: DigitalClock(),
    );
  }
}

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  DateTime _currentTime;
  String _currentHour;
  String _currentMinute;
  String _currentSecond;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _currentHour = '${_currentTime.hour}'.padLeft(2, '0');
    _currentMinute = '${_currentTime.minute}'.padLeft(2, '0');
    _currentSecond = '${_currentTime.second}'.padLeft(2, '0');
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
      _currentTime = DateTime.now();
      _currentHour = '${_currentTime.hour}'.padLeft(2, '0');
      _currentMinute = '${_currentTime.minute}'.padLeft(2, '0');
      _currentSecond = '${_currentTime.second}'.padLeft(2, '0');

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildContainer(_currentHour),
              _buildSeparator(),
              _buildContainer(_currentMinute),
              _buildSeparator(),
              _buildContainer(_currentSecond),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(String body) {
    return Container(
      width: 80,
      child: Text(
        body,
        style: TextStyle(
          fontSize: 60,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildSeparator() {
    return FadeTransition(
      opacity: _animationController,
      child: Container(
        width: 25,
        child: Text(
          ':',
          style: TextStyle(fontSize: 60, color: Colors.blue),
        ),
      ),
    );
  }
}

