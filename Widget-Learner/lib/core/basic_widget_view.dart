import 'package:flutter/material.dart';
import 'package:widget_learner/views/basic_views/app_bar_views/app_bar_view.dart';
import 'package:widget_learner/views/basic_views/center_views/center_view.dart';
import 'package:widget_learner/views/basic_views/column_views/column_view.dart';
import 'package:widget_learner/views/basic_views/container_views/container_view.dart';
import 'package:widget_learner/views/basic_views/icon_views/icon_view.dart';
import 'package:widget_learner/views/basic_views/image_views/image_view.dart';
import 'package:widget_learner/views/basic_views/raised_button_views/raised_button_view.dart';
import 'package:widget_learner/views/basic_views/row_views/row_view.dart';
import 'package:widget_learner/views/basic_views/scaffold_views/scaffold_view.dart';
import 'package:widget_learner/views/basic_views/text_views/text_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/demo_widget.dart';
import 'package:widget_learner/widgets/scaffolds/home_scaffold.dart';

class BasicWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: 'Basic Widgets',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 20, 4),
            child: Text(
              'List of Basic Widgets',
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
        title: 'Scaffold',
        body: ScaffoldView(),
      ),
      DemoWidget(
        title: 'AppBar',
        body: AppBarView(),
      ),
      DemoWidget(
        title: 'Center',
        body: CenterView(),
      ),
      DemoWidget(
        title: 'Container',
        body: ContainerView(),
      ),
      DemoWidget(
        title: 'Column',
        body: ColumnView(),
      ),
      DemoWidget(
        title: 'Row',
        body: RowView(),
      ),
      DemoWidget(
        title: 'Icon',
        body: IconView(),
      ),
      DemoWidget(
        title: 'Image',
        body: ImageView(),
      ),
      DemoWidget(
        title: 'RaisedButton',
        body: RaisedButtonView(),
      ),
      DemoWidget(
        title: 'Text',
        body: TextView(),
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
