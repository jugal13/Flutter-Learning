import 'package:flutter/material.dart';

class AppBarElevationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elevation'),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.refresh),
        ],
        elevation: 8,
      ),
    );
  }
}
