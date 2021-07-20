import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class IconView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Icon',
      url: 'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/basic_views/icon_views/icon_view.dart',
      body: Center(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              buildContainer(
                'Add Icon',
                Icon(
                  Icons.add,
                  size: 50,
                  color: Colors.red,
                ),
              ),
              buildContainer(
                'Remove Icon',
                Icon(
                  Icons.remove,
                  size: 75,
                  color: Colors.yellow,
                ),
              ),
              buildContainer(
                'Shopping Cart Icon',
                Icon(
                  Icons.shopping_cart,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String title, Icon icon) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
