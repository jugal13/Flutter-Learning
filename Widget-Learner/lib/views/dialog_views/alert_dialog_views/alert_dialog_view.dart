import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class AlertDialogView extends StatefulWidget {
  @override
  _AlertDialogViewState createState() => _AlertDialogViewState();
}

class _AlertDialogViewState extends State<AlertDialogView> {
  String dialogResponse = 'Unopened Dialog';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'AlertDialog',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/tree/master/lib/views/dialog_views/alert_dialog_views',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: getButton(
              onPressed: () {
                _openAlertDialog(context);
              },
              title: 'Open Alert Dialog',
            ),
          ),
          Center(
            child: getButton(
              onPressed: () async {
                ConfirmAction result = await _openConfirmDialog(context);
                if (result == ConfirmAction.ACCEPT) {
                  setState(() {
                    dialogResponse = 'Accepted Dialog';
                  });
                } else {
                  setState(() {
                    dialogResponse = 'Declined Dialog';
                  });
                }
              },
              title: 'Open Confirm Dialog',
            ),
          ),
          Center(
            child: Text('$dialogResponse'),
          ),
        ],
      ),
    );
  }

  Widget getButton({Function onPressed, String title}) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.blue,
      splashColor: Colors.white30,
      textColor: Colors.white,
      child: Text(title),
    );
  }

  Future<void> _openAlertDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sample Alert'),
          content: const Text('This is a sample alert'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<ConfirmAction> _openConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset settings?'),
          content: const Text(
              'This will reset your device to its default factory settings.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            FlatButton(
              child: const Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }
}

enum ConfirmAction { CANCEL, ACCEPT }
