import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int width = MediaQuery.of(context).size.width.toInt();
    return CustomScaffold(
      title: 'Image',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/image_views/image_view.dart',
      body: ListView(
        children: <Widget>[
          Image.asset('assets/lake.jpg'),
          SizedBox(
            height: 15,
          ),
          Image.network(
            'https://via.placeholder.com/${width}x$width.png?text=Network Image',
          ),
        ],
      ),
    );
  }
}
