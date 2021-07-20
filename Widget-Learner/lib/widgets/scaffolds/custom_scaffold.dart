import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomScaffold extends StatelessWidget {
  final String _title;
  final String _url;
  final Widget _body;
  final bool _hasGit;

  CustomScaffold({
    @required String title,
    @required Widget body,
    String url,
    bool hasGit: true,
  })  : this._title = title,
        this._body = body,
        this._url = url,
        this._hasGit = hasGit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this._title,
        ),
        centerTitle: true,
        actions: <Widget>[
          this._hasGit
              ? GestureDetector(
                  onTap: () {
                    openGithub(this._url);
                  },
                  child: Container(
                    child: Image.asset(
                      'assets/github.png',
                      width: 36,
                      height: 36,
                    ),
                  ),
                )
              : Offstage(),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: this._body,
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
