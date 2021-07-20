import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class LinearProgressIndicatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'LinearProgressIndicator',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/tree/master/lib/views/information_views/linear_progress_indicator_views',
      body: Center(
        child: Container(
          width: 200,
          child: LinearProgressIndicator(),
        ),
      ),
    );
  }
}
