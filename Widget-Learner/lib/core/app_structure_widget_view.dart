import 'package:flutter/material.dart';
import 'package:widget_learner/views/app_structure_views/bottom_navigation_bar_views/bottom_navigation_bar_view.dart';
import 'package:widget_learner/views/app_structure_views/drawer_views/drawer_view.dart';
import 'package:widget_learner/views/app_structure_views/sliver_app_bar_views/sliver_app_bar_view.dart';
import 'package:widget_learner/views/app_structure_views/tab_bar_views/tab_bar_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/demo_widget.dart';
import 'package:widget_learner/widgets/scaffolds/home_scaffold.dart';

class AppStructureWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: 'App Structure & Navigation Widgets',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 20, 4),
            child: Text(
              'List of App Strutcure & Navigation Widgets',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.8),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: listOfWidgets(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listOfWidgets(BuildContext context) {
    List<DemoWidget> widgets = [
      DemoWidget(
        title: 'BottomNavigationBar',
        body: BottomNavigationBarView(),
      ),
      DemoWidget(
        title: 'Drawer',
        body: DrawerView(),
      ),
      DemoWidget(
        title: 'SliverAppBar',
        body: SliverAppBarView(),
      ),
      DemoWidget(
        title: 'TabBar',
        body: CustomTabBarView(),
      ),
    ];
    return widgets
        .map(
          (widget) => CustomCard(
            title: widget.title,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => widget.body,
              ),
            ),
          ),
        )
        .toList();
  }
}
