import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class ContainerShadowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Container',
      url: 'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/container_views/container_shadow_view.dart',
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.blue, blurRadius: 4, spreadRadius: 5),
            ],
          ),
          child: Center(
            child: Text('Container'),
          ),
        ),
      ),
    );
  }
}
