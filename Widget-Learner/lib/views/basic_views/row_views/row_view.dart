import 'package:flutter/material.dart';
import 'package:widget_learner/views/basic_views/row_views/different_row_view.dart';
import 'package:widget_learner/views/basic_views/row_views/row_with_column_view.dart';
import 'package:widget_learner/views/basic_views/row_views/simple_row_view.dart';
import 'package:widget_learner/views/basic_views/row_views/space_around_row_view.dart';
import 'package:widget_learner/views/basic_views/row_views/space_between_row_view.dart';
import 'package:widget_learner/views/basic_views/row_views/space_evenly_row_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/custom_view.dart';

class RowView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'Row',
      sampleTitle: 'Sample Rows',
      listOfWidgetChildren: <Widget>[
        CustomCard(
          title: 'Simple Row',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SimpleRowView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Simple Row with Different Widgets',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DifferentRowView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Space Evenly Row View',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpaceEvenlyRowView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Space Between Row View',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpaceBetweenRowView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Space Around Row View',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SpaceAroundRowView(),
            ),
          ),
        ),
        CustomCard(
          title: 'Row with Nested Column',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => RowWithColumnView(),
            ),
          ),
        ),
      ],
    );
  }
}
