import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class TextFieldView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'TextField',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/input_views/text_field_views/text_field_view.dart',
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            cursorColor: Theme.of(context).primaryColorDark,
            decoration: InputDecoration(
              hintText: 'Text Field',
              labelText: 'Text Field Label',
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
