import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class BottomSheetView extends StatefulWidget {
  @override
  _BottomSheetViewState createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'BottomSheet',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/dialog_views/expansion_panel_views/expansion_panel_view.dart',
      body: Center(
        child: RaisedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SafeArea(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.music_note,
                          ),
                          title: Text('Music'),
                          onTap: () => {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.videocam,
                          ),
                          title: Text('Video'),
                          onTap: () => {},
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Bottom Sheet'),
        ),
      ),
    );
  }
}
