import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class IconButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'IconButton',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/button_views/icon_button_views/icon_button_view.dart',
      body: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.delete,
          ),
        ),
      ),
    );
  }
}
