import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class ListTileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'ListTile',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/layout_views/list_tile_views/list_tile_view.dart',
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          color: Colors.blue,
          child: ListTile(
            leading: Icon(
              Icons.apps,
            ),
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            trailing: Icon(
              Icons.remove_red_eye,
            ),
          ),
        ),
      ),
    );
  }
}
