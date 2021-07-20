import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class FlatButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'FlatButton',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/button_views/flat_button_views/flat_button_view.dart',
      body: Center(
        child: FlatButton(
          onPressed: () {},
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.white30,
          child: Text('FlatButton View'),
        ),
      ),
    );
  }
}
