import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: AnalogClock(),
    );
  }
}

class AnalogClock extends StatefulWidget {
  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  DateTime _currentTime;
  int _currentHour;
  int _currentMinute;
  int _currentSecond;

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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double width = screenWidth > 600 ? 400 : 250;
    
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: width,
          height: width,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                child: Container(),
                painter: TickPainter(),
              ),
              CustomPaint(
                child: Container(),
                painter: HourHandPainter(
                  hours: this._currentHour,
                  minutes: this._currentMinute,
                ),
              ),
              CustomPaint(
                child: Container(),
                painter: MinuteHandPainter(
                  minutes: this._currentMinute,
                ),
              ),
              CustomPaint(
                child: Container(),
                painter: SecondHandPainter(
                  seconds: this._currentSecond,
                ),
              ),
              Center(
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void refreshData() {
    _currentTime = DateTime.now();
    _currentHour = _currentTime.hour;
    _currentMinute = _currentTime.minute;
    _currentSecond = _currentTime.second;
  }
}

class TickPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final double angle = 2 * math.pi / 60;

    canvas.translate(radius, radius);

    for (int i = 0; i < 60; i++) {
      double length = i % 5 == 0 ? 15 : 5;
      paint.color = i % 5 == 0 ? Colors.pink[700] : Colors.blue;

      canvas.drawLine(
        Offset(0, -radius),
        Offset(0, -radius + length),
        paint,
      );

      canvas.rotate(angle);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class HourHandPainter extends CustomPainter {
  final int _hours;
  final int _minutes;

  HourHandPainter({
    @required int hours,
    @required int minutes,
  })  : this._hours = hours,
        this._minutes = minutes;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.pink[700]
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final double angle = getAngle;
    final double length = radius == 200 ? 100 : 60;

    canvas.translate(radius, radius);
    canvas.rotate(angle);
    canvas.drawLine(
      Offset(0, 0),
      Offset(0, -radius + length),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double get getAngle {
    final int hour = this._hours > 12 ? this._hours - 12 : this._hours;
    final double angle = 0.5 * (60 * hour + this._minutes);
    return angle * math.pi / 180;
  }
}

class MinuteHandPainter extends CustomPainter {
  final int _minutes;

  MinuteHandPainter({@required int minutes}) : this._minutes = minutes;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.pink[700]
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final double angle = getAngle;
    final double length = radius == 200 ? 60 : 45;

    canvas.translate(radius, radius);
    canvas.rotate(angle);
    canvas.drawLine(Offset(0, 0), Offset(0, -radius + length), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double get getAngle {
    return (this._minutes * 6) * math.pi / 180;
  }
}

class SecondHandPainter extends CustomPainter {
  final int _seconds;

  SecondHandPainter({@required int seconds}) : this._seconds = seconds;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..color = Colors.blue
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;

    final double radius = size.width / 2;
    final double angle = getAngle;

    canvas.translate(radius, radius);
    canvas.rotate(angle);
    canvas.drawLine(Offset(0, 0), Offset(0, -radius + 35), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double get getAngle {
    return (this._seconds * 6) * math.pi / 180;
  }
}

