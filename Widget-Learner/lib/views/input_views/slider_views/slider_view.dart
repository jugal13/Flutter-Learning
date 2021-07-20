import 'package:flutter/material.dart';
import 'package:widget_learner/widgets/scaffolds/custom_scaffold.dart';

class SliderView extends StatefulWidget {
  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Slider',
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('0'),
            Container(
              width: 250,
              child: Slider(
                onChanged: (double value) {
                  setState(() => sliderValue = value);
                },
                value: sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: '${sliderValue.toInt()}',
              ),
            ),
            Text('100'),
          ],
        ),
      ),
    );
  }
}
