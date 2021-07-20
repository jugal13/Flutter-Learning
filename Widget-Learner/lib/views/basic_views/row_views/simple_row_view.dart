import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class SimpleRowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Row',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/row_views/simple_row_view.dart',
      body: Row(
        children: <Widget>[
          Text('Child 1'),
          Text('Child 2'),
          Text('Child 3'),
        ],
      ),
    );
  }
}
