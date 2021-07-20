import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:animator/animator.dart';

void main() => runApp(MyApp());

class MainBloc extends StatesRebuilder {
  bool toggleCurve = true;
  rebuild() {
    toggleCurve = !toggleCurve;
    rebuildStates(['widget 1','widget 2','widget 3']);
  }
}

final mainBloc = MainBloc();

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Animation 0'),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Widget is animated on rebuild'),
        Animator(
          tween: Tween<double>(begin: 0, end: 1.5),
          name: "widget 1",
          blocs: [mainBloc],
          duration: Duration(milliseconds: 200),
          cycles: 1,
          builder: (anim) => Center(
                child: Transform.scale(
                  scale: anim.value,
                  child: FlutterLogo(size: 50),
                ),
              ),
        ),
        Divider(),
        Text('Widget is not animated on rebuild'),
        Animator(
          tween: Tween<double>(begin: 1.5, end: 1.0),
          name: "widget 2",
          blocs: [mainBloc],
          duration: Duration(milliseconds: 400),
          builder: (anim) => Center(
                child: Transform.scale(
                  scale: anim.value,
                  child: FlutterLogo(
                    size: 50,
                    colors: Colors.red,
                  ),
                ),
              ),
        ),
        Divider(),
        Text('Animation is reset on rebuild. Curve changes on rebuild'),
        StateBuilder(
          tag: 'widget 3',
          blocs: [mainBloc],
          builder: (_, tag) => Animator(
                duration: Duration(seconds: 2),
                repeats: 1,
                curve: mainBloc.toggleCurve ? Curves.linear : Curves.bounceIn,
                builder: (anim) => Center(
                      child: Transform.scale(
                        scale: anim.value,
                        child: FlutterLogo(size: 50),
                      ),
                    ),
              ),
        ),
        RaisedButton(
          child: Text('Rebuild'),
          onPressed: () => mainBloc.rebuild(),
        )
      ],
    );
  }
}

// class MyApp extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Animator(
//       tweenMap: {
//         "scaleAnim": Tween<double>(begin: 300, end: 25),
//         "translateAnim": Tween<Offset>(begin: Offset(2, 0), end: Offset.zero),
//         "rotateAnim": Tween<double>(begin: pi/2, end: 0),
//       },
//       cycles: 1,
//       builderMap: (anim) => Center(
//         child: FractionalTranslation(
//           translation: anim["translateAnim"].value,
//           child: Transform.rotate(
//             angle: anim["rotateAnim"].value,
//             child: Container(
//               margin: EdgeInsets.symmetric(vertical: 10),
//               height: anim["scaleAnim"].value,
//               width: anim['scaleAnim'].value,
//               child: FlutterLogo(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }