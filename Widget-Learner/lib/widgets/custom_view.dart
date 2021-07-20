import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class CustomView extends StatelessWidget {
  final String _title;
  final String _sampleTitle;

  final List<Widget> _listOfWidgetChildren;

  CustomView({
    @required String title,
    @required String sampleTitle,
    @required List<Widget> listOfWidgetChildren,
  })  : this._title = title,
        this._sampleTitle = sampleTitle,
        this._listOfWidgetChildren = listOfWidgetChildren;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: this._title,
      hasGit: false,
      url: '',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 20, 4),
            child: Text(
              this._sampleTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.8),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: this._listOfWidgetChildren,
            ),
          )
        ],
      ),
    );
  }
}
