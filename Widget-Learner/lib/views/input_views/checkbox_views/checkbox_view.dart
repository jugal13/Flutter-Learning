import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class CheckboxView extends StatefulWidget {
  @override
  _CheckboxViewState createState() => _CheckboxViewState();
}

class _CheckboxViewState extends State<CheckboxView> {
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Checkbox',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/input_views/checkbox_views/checkbox_view.dart',
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Checkbox(
              onChanged: (bool value) {
                setState(() {
                  checkValue = value;
                });
              },
              value: checkValue,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            Text(
              'Checkbox',
            ),
          ],
        ),
      ),
    );
  }
}
