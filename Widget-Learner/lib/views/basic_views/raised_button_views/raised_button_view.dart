import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class RaisedButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'RaisedButton',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/raised_button_views/raised_button_view.dart',
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Sample Raised Button',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: Colors.purple,
                splashColor: Colors.white30,
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {},
                child: Icon(
                  Icons.radio_button_checked,
                  size: 20,
                  color: Colors.red,
                ),
                color: Colors.black,
                splashColor: Colors.white30,
              ),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  'Elevated Raised Button',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                splashColor: Colors.white30,
                elevation: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
