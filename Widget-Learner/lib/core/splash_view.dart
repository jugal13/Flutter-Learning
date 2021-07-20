import 'package:flutter/material.dart';
import 'package:widget_learner/core/home_view.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: 800),
    ).then(
      (_) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 60,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.settings,
                color: Colors.blue,
                size: 40,
              ),
              SizedBox(
                height: 8,
              ),
              LinearProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
