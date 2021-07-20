import 'package:flutter/material.dart';
import 'package:textstreams_example/textstream.dart';

class textView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    TextStream manager = TextStream();
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Text")
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
    );
  }
}