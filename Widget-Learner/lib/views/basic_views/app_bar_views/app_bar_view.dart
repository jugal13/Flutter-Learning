import 'package:flutter/material.dart';
import 'package:widget_learner/views/basic_views/app_bar_views/app_bar_actions_view.dart';
import 'package:widget_learner/views/basic_views/app_bar_views/app_bar_elevation_view.dart';
import 'package:widget_learner/views/basic_views/app_bar_views/app_bar_title_view.dart';
import 'package:widget_learner/views/basic_views/app_bar_views/simple_app_bar_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/custom_view.dart';

class AppBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'AppBar',
      sampleTitle: 'Sample AppBar',
      listOfWidgetChildren: <Widget>[
        CustomCard(
          title: 'Simple AppBar',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SimpleAppBarView(),
            ),
          ),
        ),
        CustomCard(
          title: 'AppBar with title',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AppBarTitleView(),
            ),
          ),
        ),
        CustomCard(
          title: 'AppBar with Actions',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AppBarActionsView(),
            ),
          ),
        ),
        CustomCard(
          title: 'AppBar with Elevation',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AppBarElevationView(),
            ),
          ),
        ),
      ],
    );
  }
}
