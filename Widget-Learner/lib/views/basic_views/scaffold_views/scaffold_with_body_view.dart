import 'package:flutter/material.dart';

class ScaffoldWithBodyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Scaffold with Body'),
      ),
    );
  }
}
