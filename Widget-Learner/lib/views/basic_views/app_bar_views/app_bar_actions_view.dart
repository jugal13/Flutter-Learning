import 'package:flutter/material.dart';

class AppBarActionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actions'),
        actions: <Widget>[
          Icon(Icons.add),
          Icon(Icons.refresh),
        ],
      ),
    );
  }
}
