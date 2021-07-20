import 'package:flutter/material.dart';
import 'package:textstreams_example/text_view.dart';
import 'package:textstreams_example/textstream.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streams'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(50),
              child: TextField(
                controller: controller1,
              )
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: TextField(
                controller: controller2,
              )
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          List<String> text = [controller1.text,controller2.text];
          textStream.text = text;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => textView()),
          );
        },
        child: Icon(Icons.text_fields),
      ),
    );
  }
}