import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class RadioView extends StatefulWidget {
  @override
  _RadioViewState createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  bool test = true;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Radio',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/input_views/radio_views/radio_view.dart',
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Radio<bool>(
                  value: true,
                  groupValue: test,
                  onChanged: (bool value) {
                    setState(() {
                      test = value;
                    });
                  },
                ),
                Container(
                  child: const Text(
                    'True',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Radio<bool>(
                  value: false,
                  groupValue: test,
                  onChanged: (bool value) {
                    setState(() {
                      test = value;
                    });
                  },
                ),
                Container(
                  child: const Text(
                    'False',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
