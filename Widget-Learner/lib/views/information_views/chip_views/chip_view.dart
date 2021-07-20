import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class ChipView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Chip',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/information_views/chip_views/chip_view.dart',
      body: Center(
        child: Chip(
          avatar: Icon(
            Icons.person,
          ),
          label: Text(
            'Chip View',
          ),
          elevation: 5,
        ),
      ),
    );
  }
}
