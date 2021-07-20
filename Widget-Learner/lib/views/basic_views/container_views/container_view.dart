import 'package:flutter/material.dart';
import 'package:widget_learner/views/basic_views/container_views/container_align_view.dart';
import 'package:widget_learner/views/basic_views/container_views/container_border_view.dart';
import 'package:widget_learner/views/basic_views/container_views/container_rounded_borders_view.dart';
import 'package:widget_learner/views/basic_views/container_views/container_shadow_view.dart';
import 'package:widget_learner/views/basic_views/container_views/simple_container_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/custom_view.dart';

class ContainerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'Container',
      sampleTitle: 'Sample Containers',
      listOfWidgetChildren: [
        CustomCard(
          title: 'Simple Container',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SimpleContainerView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Container with Border',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContainerBorderView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Container with Shadow',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContainerShadowView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Container with Alginment Property',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContainerAlignView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Container with Different Border Property',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContainerRoundedBorderView(),
            ),
          ),
        ),
      ],
    );
  }
}
