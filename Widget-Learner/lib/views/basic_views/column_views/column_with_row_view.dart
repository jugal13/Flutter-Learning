import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class ColumnWithRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Column',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/column_views/column_with_row_view.dart',
      body: Column(
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
          Row(
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
