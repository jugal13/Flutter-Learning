import 'package:flutter/material.dart';
import 'package:widget_learner/core/splash_view.dart';

void main() => runApp(MainApplication());

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
