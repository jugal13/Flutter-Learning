import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomNavigationBarView extends StatefulWidget {
  @override
  _BottomNavigationBarViewState createState() =>
      _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int _currentIndex = 0;
  List<Widget> _children = [
    PlaceholderWidget(
      color: Colors.black,
      index: 0,
    ),
    PlaceholderWidget(
      color: Colors.blue,
      index: 1,
    ),
    PlaceholderWidget(
      color: Colors.red,
      index: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bat'),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              openGithub(
                'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/app_structure_views/bottom_navigation_bar_views/bottom_navigation_bar_view.dart',
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
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void openGithub(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final int index;

  PlaceholderWidget({
    @required Color color,
    @required int index,
  })  : this.color = color,
        this.index = index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(25),
        color: color,
        child: Text(
          '$index',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
