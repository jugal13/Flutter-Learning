import 'package:flutter/material.dart';
import 'package:division/division.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Division Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Division Example',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Division(
              style: StyleClass()
                ..padding(
                  all: 20,
                )
                ..background.hex(
                  '77A6FF',
                )
                ..borderRadius(
                  all: 50,
                )
                ..elevation(
                  10,
                  angle: 45,
                  opacity: 0.8,
                  color: rgb(
                    0,
                    100,
                    140,
                  ),
                )
                ..ripple(
                  true,
                  splashColor: Color(0xFFFFFFFF),
                ),
              gesture: GestureClass()
                ..onTap(
                  () => print(
                    'Division Button Clicked',
                  ),
                ),
              child: Container(
                child: Text(
                  'Click Me',
                ),
              ),
            ),
            Spacer(),
            ButtonTheme(
              minWidth: 0,
              child: RaisedButton(
                onPressed: () => print(
                  'Raised Button Clicked',
                ),
                elevation: 10,
                padding: EdgeInsets.all(20),
                color: Color(0xFF77A6FF),
                splashColor: Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Click Me',
                ),
              ),
            ),
            Spacer(),
            Material(
              elevation: 10,
              color: Color(0xFF77A6FF),
              shadowColor: Color.fromRGBO(0, 100, 140, 1),
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                onTap: () => print('Ink Well Clicked'),
                borderRadius: BorderRadius.circular(50),
                splashColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    'Click Me',
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
