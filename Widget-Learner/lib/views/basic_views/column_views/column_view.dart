import 'package:flutter/material.dart';
import 'package:widget_learner/views/basic_views/column_views/column_with_row_view.dart';
import 'package:widget_learner/views/basic_views/column_views/different_column_view.dart';
import 'package:widget_learner/views/basic_views/column_views/simple_column_view.dart';
import 'package:widget_learner/views/basic_views/column_views/space_around_column_view.dart';
import 'package:widget_learner/views/basic_views/column_views/space_between_column_view.dart';
import 'package:widget_learner/views/basic_views/column_views/space_evenly_column_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/custom_view.dart';

class ColumnView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'Column',
      sampleTitle: 'Sample Columns',
      listOfWidgetChildren: <Widget>[
        CustomCard(
          title: 'Simple Column',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SimpleColumnView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Simple Column with Different Widgets',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DifferentColumnView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Space Evenly Column View',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpaceEvenlyColumnView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Space Between Column View',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpaceBetweenColumnView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Space Around Column View',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpaceAroundColumnView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Column with Nested Row',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ColumnWithRowView(),
            ),
          ),
        ),
      ],
    );
  }
}
