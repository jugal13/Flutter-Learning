import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class CardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Card',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/information_views/card_views/card_view.dart',
      body: Center(
        child: Card(
          color: Colors.blue,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Card View',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
