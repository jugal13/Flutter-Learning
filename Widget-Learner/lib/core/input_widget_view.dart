import 'package:flutter/material.dart';
import 'package:widget_learner/views/input_views/checkbox_views/checkbox_view.dart';
import 'package:widget_learner/views/input_views/date_time_picker_views/date_time_picker_view.dart';
import 'package:widget_learner/views/input_views/radio_views/radio_view.dart';
import 'package:widget_learner/views/input_views/slider_views/slider_view.dart';
import 'package:widget_learner/views/input_views/switch_views/switch_view.dart';
import 'package:widget_learner/views/input_views/text_field_views/text_field_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/demo_widget.dart';
import 'package:widget_learner/widgets/scaffolds/home_scaffold.dart';

class InputWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: 'Input Widget',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 20, 4),
            child: Text(
              'List of Input Widgets',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.8),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: listOfWidgets(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listOfWidgets(BuildContext context) {
    List<DemoWidget> widgets = [
      DemoWidget(
        title: 'Checkbox',
        body: CheckboxView(),
      ),
      DemoWidget(
        title: 'Date & Time Pickers',
        body: DateTimePickerView(),
      ),
      DemoWidget(
        title: 'Radio',
        body: RadioView(),
      ),
      DemoWidget(
        title: 'Slider',
        body: SliderView(),
      ),
      DemoWidget(
        title: 'Switch',
        body: SwitchView(),
      ),
      DemoWidget(
        title: 'TextField',
        body: TextFieldView(),
      ),
    ];
    return widgets
        .map(
          (widget) => CustomCard(
            title: widget.title,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => widget.body,
              ),
            ),
          ),
        )
        .toList();
  }
}
