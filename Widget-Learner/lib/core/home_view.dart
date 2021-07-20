import 'package:flutter/material.dart';
import 'package:widget_learner/core/app_structure_widget_view.dart';
import 'package:widget_learner/core/basic_widget_view.dart';
import 'package:widget_learner/core/button_widget_view.dart';
import 'package:widget_learner/core/dialog_widget_view.dart';
import 'package:widget_learner/core/information_widget_view.dart';
import 'package:widget_learner/core/input_widget_view.dart';
import 'package:widget_learner/core/layout_widget_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/demo_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 20, 4),
            child: Text(
              'List of Widgets',
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
        title: 'Basic Widgets',
        body: BasicWidgetView(),
      ),
      DemoWidget(
        title: 'App Structure & Navigation',
        body: AppStructureWidgetView(),
      ),
      DemoWidget(
        title: 'Buttons',
        body: ButtonWidgetView(),
      ),
      DemoWidget(
        title: 'Input and Selections',
        body: InputWidgetView(),
      ),
      DemoWidget(
        title: 'Dialogs, alerts, and panels',
        body: DialogWidgetView(),
      ),
      DemoWidget(
        title: 'Information displays',
        body: InformationWidgetView(),
      ),
      DemoWidget(
        title: 'Layout',
        body: LayoutWidgetView(),
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
