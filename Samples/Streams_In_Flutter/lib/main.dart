import 'package:flutter/material.dart';
import 'package:streams_example/ContactManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ContactManager manager = ContactManager();

    return MaterialApp(
      title: "Stream Demo",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stream Demo"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                label: StreamBuilder<int>(
                  stream: manager.contactCounter,
                  builder: (context, snapshot) {
                    return Text(
                      (snapshot.data ?? 0).toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                    );
                  }
                ),
                backgroundColor: Colors.redAccent
              ),
            )
          ],
        ),
        body: StreamBuilder<List<String>>(
          stream: manager.contactListNow,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("Contacts"),
              );
            }
            else {
              List<String> contacts = snapshot.data;
              return ListView.separated(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(contacts[index])
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
            }
          }
        ),
      )
    );
  }
}