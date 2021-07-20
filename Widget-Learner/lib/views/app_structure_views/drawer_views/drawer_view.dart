import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              openGithub(
                'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/app_structure_views/drawer_views/drawer_view.dart',
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
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Go Back',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.blue,
          splashColor: Colors.white30,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              margin: EdgeInsets.zero,
              child: Text('Drawer Header'),
            ),
            Divider(),
            ListTile(
              title: Text('Tile 1'),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(),
            ListTile(
              title: Text('Tile 2'),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(),
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
