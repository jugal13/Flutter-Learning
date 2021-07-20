import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class SpaceAroundColumnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Column',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/column_views/space_around_column_view.dart',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FlutterLogo(
            size: 100.0,
            colors: Colors.red,
          ),
          Text(
            "Column 2",
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
