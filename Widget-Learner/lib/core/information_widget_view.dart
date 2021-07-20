import 'package:flutter/material.dart';
import 'package:widget_learner/views/information_views/grid_view_views/grid_view_view.dart';
import 'package:widget_learner/views/information_views/card_views/card_view.dart';
import 'package:widget_learner/views/information_views/chip_views/chip_view.dart';
import 'package:widget_learner/views/information_views/circular_progress_indicator_views/circular_progress_indicator_view.dart';
import 'package:widget_learner/views/information_views/data_table_views/data_table_view.dart';
import 'package:widget_learner/views/information_views/linear_progress_indicator_views/linear_progress_indicator_view.dart';
import 'package:widget_learner/views/information_views/tooltip_views/tooltip_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/demo_widget.dart';
import 'package:widget_learner/widgets/scaffolds/home_scaffold.dart';

class InformationWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: 'Information displays Widget',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 20, 4),
            child: Text(
              'List of Information displays Widgets',
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
        title: 'Card',
        body: CardView(),
      ),
      DemoWidget(
        title: 'Chip',
        body: ChipView(),
      ),
      DemoWidget(
        title: 'CircularProgressIndicator',
        body: CircularProgressIndicatorView(),
      ),
      DemoWidget(
        title: 'DataTable',
        body: DataTableView(),
      ),
      DemoWidget(
        title: 'GridView',
        body: GridViewView(),
      ),
      DemoWidget(
        title: 'LinearProgressIndicator',
        body: LinearProgressIndicatorView(),
      ),
      DemoWidget(
        title: 'Tooltip',
        body: TooltipView(),
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
