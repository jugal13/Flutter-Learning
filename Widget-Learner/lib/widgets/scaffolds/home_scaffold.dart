import 'package:flutter/material.dart';

class HomeScaffold extends StatelessWidget {
  final String _title;

  final Widget _body;

  HomeScaffold({
    @required String title,
    @required Widget body,
  })  : this._title = title,
        this._body = body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.home,
          ),
        ),
        title: Text(
          this._title,
          maxLines: 2,
        ),
        centerTitle: true,
      ),
      body: this._body,
    );
  }
}
