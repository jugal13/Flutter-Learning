import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class GridViewView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'GridView',
      url: 'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/information_views/grid_view_views/grid_view_view.dart',
      body: Center(
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(
            20,
            (index) {
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
