import 'package:flutter/material.dart';
import 'package:widget_learner/views/layout_views/divider_views/divider_view.dart';
import 'package:widget_learner/views/layout_views/list_tile_views/list_tile_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/demo_widget.dart';
import 'package:widget_learner/widgets/scaffolds/home_scaffold.dart';

class LayoutWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: 'Layout Widget',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 20, 4),
            child: Text(
              'List of Layout Widgets',
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
        title: 'Divider',
        body: DividerView(),
      ),
      DemoWidget(
        title: 'ListTile',
        body: ListTileView(),
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
