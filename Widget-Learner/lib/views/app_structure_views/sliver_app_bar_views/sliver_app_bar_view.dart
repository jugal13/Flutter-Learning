import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SliverAppBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              actions: <Widget>[
                GestureDetector(
                  onTap: () {
                    openGithub(
                      'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/app_structure_views/sliver_app_bar_views/sliver_app_bar_view.dart',
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
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "Collapsing App Bar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?"
                  "auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Text("Sample Text"),
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
