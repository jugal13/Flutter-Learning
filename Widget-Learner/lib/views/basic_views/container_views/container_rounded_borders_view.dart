import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class ContainerRoundedBorderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Container',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/container_views/container_rounded_borders_view.dart',
      body: Center(
        child: Container(
          height: 300.0,
          width: 300.0,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(75),
            ),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'Hello padding topLeft: 25, bottomLeft: 50, bottomRight: 75, topRight: 100',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
