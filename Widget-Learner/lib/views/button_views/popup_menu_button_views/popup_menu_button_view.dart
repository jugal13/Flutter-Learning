import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class PopupMenuButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'PopupMenuButton',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/button_views/popup_menu_button_views/popup_menu_button_view.dart',
      body: Center(
        child: PopupMenuButton(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 1,
                child: Text("First"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("Second"),
              ),
            ];
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
