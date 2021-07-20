import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class DateTimePickerView extends StatefulWidget {
  @override
  _DateTimePickerViewState createState() => _DateTimePickerViewState();
}

class _DateTimePickerViewState extends State<DateTimePickerView> {
  DateTime date;
  TimeOfDay time;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Date & Time Pickers',
      url:
          'https://github.com/jugalw13/Flutter-Widget-Learner/blob/master/lib/views/input_views/date_time_picker_views/date_time_picker_view.dart',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: RaisedButton(
              color: Colors.blue,
              splashColor: Colors.white30,
              textColor: Colors.white,
              child: this.date == null ? Text('Select Date') : Text('$date'),
              onPressed: () async {
                DateTime selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2030),
                  builder: (BuildContext context, Widget child) {
                    return child;
                  },
                );
                setState(() {
                  date = selectedDate;
                });
              },
            ),
          ),
          Center(
            child: RaisedButton(
              color: Colors.blue,
              splashColor: Colors.white30,
              textColor: Colors.white,
              child: this.time == null ? Text('Select Time') : Text('$time'),
              onPressed: () async {
                TimeOfDay selectedTime = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );
                setState(() {
                  time = selectedTime;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
