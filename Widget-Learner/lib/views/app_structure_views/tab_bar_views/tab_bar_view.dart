import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTabBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                openGithub(
                  'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/app_structure_views/tab_bar_views/tab_bar_view.dart',
                );
              },
              child: Container(
                child: Image.asset(
                  'assets/github.png',
                  width: 36,
                  height: 36,
                ),
              ),
            ),
            SizedBox(width: 12),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.directions_car,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.directions_transit,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.directions_bike,
                ),
              ),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            Icon(
              Icons.directions_car,
            ),
            Icon(
              Icons.directions_transit,
            ),
            Icon(
              Icons.directions_bike,
            ),
          ],
        ),
      ),
    );
  }

  void openGithub(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
