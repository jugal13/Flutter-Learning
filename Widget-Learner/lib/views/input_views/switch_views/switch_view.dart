import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class SwitchView extends StatefulWidget {
  @override
  _SwitchViewState createState() => _SwitchViewState();
}

class _SwitchViewState extends State<SwitchView> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Switch',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/input_views/switch_views/switch_view.dart',
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              onChanged: (bool value) {
                setState(() {
                  isOn = value;
                });
              },
              value: isOn,
            ),
            Text('$isOn'),
          ],
        ),
      ),
    );
  }
}
