import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class CenterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Center',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/center_views/center_view.dart',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              height: 120,
              width: 120,
              child: Center(
                child: Text(
                  'Center Widget centers items',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
              width: 150,
              height: 150,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
