import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class DropdownButtonView extends StatefulWidget {
  @override
  _DropdownButtonViewState createState() => _DropdownButtonViewState();
}

class _DropdownButtonViewState extends State<DropdownButtonView> {
  String _currentValue;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'DropdownButton',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/button_views/dropdown_button_views/dropdown_button_view.dart',
      body: Center(
        child: DropdownButton<String>(
          hint: Text('Select Value'),
          value: _currentValue,
          items: <DropdownMenuItem<String>>[
            DropdownMenuItem(
              value: 'Value 1',
              child: Text('Value 1'),
            ),
            DropdownMenuItem(
              value: 'Value 2',
              child: Text('Value 2'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              this._currentValue = value;
            });
          },
        ),
      ),
    );
  }
}
