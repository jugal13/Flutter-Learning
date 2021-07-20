import 'package:flutter/material.dart';

class DemoWidget {
  final String _title;
  final Widget _body;

  DemoWidget({
    @required String title,
    @required Widget body,
  })  : this._title = title,
        this._body = body;

  String get title => this._title;
  Widget get body => this._body;
}
