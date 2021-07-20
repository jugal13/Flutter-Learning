import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class OutlineButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'OutlineButton',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/button_views/outline_button_views/outline_button_view.dart',
      body: Center(
        child: OutlineButton(
          onPressed: () {},
          child: Text(
            'Outline Button',
          ),
        ),
      ),
    );
  }
}
