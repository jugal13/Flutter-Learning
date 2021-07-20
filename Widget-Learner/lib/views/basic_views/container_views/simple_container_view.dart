import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class SimpleContainerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Container',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/container_views/simple_container_view.dart',
      body: Container(
        margin: EdgeInsets.all(25),
        padding: EdgeInsets.all(25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: FlutterLogoDecoration(),
      ),
    );
  }
}
