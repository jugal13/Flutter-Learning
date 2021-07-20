import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class SimpleColumnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Column',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/column_views/simple_column_view.dart',
      body: Column(
        children: <Widget>[
          Text('Child 1'),
          Text('Child 2'),
          Text('Child 3'),
        ],
      ),
    );
  }
}
