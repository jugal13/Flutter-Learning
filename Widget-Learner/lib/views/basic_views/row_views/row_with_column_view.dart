import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class RowWithColumnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Row',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/row_views/row_with_column_view.dart',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25),
            color: Colors.blue,
            child: Text(
              'Child 1',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(25),
            color: Colors.blue,
            child: Text(
              'Child 2',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(25),
                color: Colors.blue,
                child: Text(
                  'Child 3.1',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                color: Colors.blue,
                child: Text(
                  'Child 3.2',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
