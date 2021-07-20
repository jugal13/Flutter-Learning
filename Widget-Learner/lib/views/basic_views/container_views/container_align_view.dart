import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class ContainerAlignView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Container',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/container_views/container_align_view.dart',
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.green,
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(20.0),
          child: FlutterLogo(
            size: 100.0,
          ),
        ),
      ),
    );
  }
}
