import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class CircularProgressIndicatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'CircularProgressIndicator',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/information_views/circular_progress_indicator_views/circular_progress_indicator_view.dart',
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 5,
        ),
      ),
    );
  }
}
