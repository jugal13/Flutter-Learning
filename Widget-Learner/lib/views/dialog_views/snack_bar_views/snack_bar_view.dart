import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SnackBarView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('SnackBar'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              openGithub(
                'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/dialog_views/snack_bar_views/snack_bar_view.dart',
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
          onPressed: () {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('Hello from SnackBar'),
              ),
            );
          },
          child: Text('SnackBar View'),
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
