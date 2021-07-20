import 'package:flutter/material.dart';
import 'package:widget_learner/views/button_views/button_bar_views/button_bar_view.dart';
import 'package:widget_learner/views/button_views/dropdown_button_views/dropdown_button_view.dart';
import 'package:widget_learner/views/button_views/flat_button_views/flat_button_view.dart';
import 'package:widget_learner/views/button_views/floating_action_button_views/floating_action_button_view.dart';
import 'package:widget_learner/views/button_views/icon_button_views/icon_button_view.dart';
import 'package:widget_learner/views/button_views/outline_button_views/outline_button_view.dart';
import 'package:widget_learner/views/button_views/popup_menu_button_views/popup_menu_button_view.dart';
import 'package:widget_learner/widgets/custom_card.dart';
import 'package:widget_learner/widgets/demo_widget.dart';
import 'package:widget_learner/widgets/scaffolds/home_scaffold.dart';

class ButtonWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      title: 'Button Widgets',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 20, 4),
            child: Text(
              'List of Button Widgets',
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
        title: 'ButtonBar',
        body: ButtonBarView(),
      ),
      DemoWidget(
        title: 'DropdownButton',
        body: DropdownButtonView(),
      ),
      DemoWidget(
        title: 'FlatButton',
        body: FlatButtonView(),
      ),
      DemoWidget(
        title: 'FloatingActionButton',
        body: FloatingActionButtonView(),
      ),
      DemoWidget(
        title: 'IconButton',
        body: IconButtonView(),
      ),
      DemoWidget(
        title: 'OutlineButton',
        body: OutlineButtonView(),
      ),
      DemoWidget(
        title: 'PopupMenuButton',
        body: PopupMenuButtonView(),
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
