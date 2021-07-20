import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class TooltipView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Tooltip',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/information_views/tooltip_views/tooltip_view.dart',
      body: Center(
        child: Tooltip(
          child: Text('Add'),
          message: 'Add',
        ),
      ),
    );
  }
}
