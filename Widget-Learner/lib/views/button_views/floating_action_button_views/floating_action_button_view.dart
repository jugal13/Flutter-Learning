import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class FloatingActionButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'FloatingActionButton',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/button_views/floating_action_button_views/floating_action_button_view.dart',
      body: Center(
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
