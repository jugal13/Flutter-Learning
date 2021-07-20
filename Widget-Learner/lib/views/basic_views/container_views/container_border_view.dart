import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class ContainerBorderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Container',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/container_views/container_border_view.dart',
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            border: Border.all(
              width: 5.0,
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text('Container'),
          ),
        ),
      ),
    );
  }
}
