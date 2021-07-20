import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class DividerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Divider',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/layout_views/divider_views/divider_view.dart',
      body: Center(
        child: Divider(
          thickness: 12,
          color: Colors.black,
          indent: 10,
          endIndent: 10,
        ),
      ),
    );
  }
}
