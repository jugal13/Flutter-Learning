import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class SpaceEvenlyRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Row',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/row_views/space_evenly_row_view.dart',
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlutterLogo(
            size: 100.0,
            colors: Colors.red,
          ),
          Text(
            "Row 2",
            style: TextStyle(fontSize: 24),
          ),
          Container(
            color: Colors.green,
            height: 100.0,
            width: 100.0,
          )
        ],
      ),
    );
  }
}
