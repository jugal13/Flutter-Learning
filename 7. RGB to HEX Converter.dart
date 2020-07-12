import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: RGBToHex(),
    );
  }
}

class RGBToHex extends StatefulWidget {
  @override
  _RGBToHexState createState() => _RGBToHexState();
}

class _RGBToHexState extends State<RGBToHex> {
  double _redValue;
  double _greenValue;
  double _blueValue;
  double _alphaValue;

  @override
  void initState() {
    super.initState();
    this._redValue = 0;
    this._greenValue = 0;
    this._blueValue = 0;
    this._alphaValue = 255;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = screenWidth < 650
        ? screenWidth * 0.9
        : screenWidth < 850 ? screenWidth * 0.7 : screenWidth * 0.5;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: width,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'RGB Sliders',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    verticalSpace20,
                    _buildSlider(
                      onChanged: (double value) {
                        _redValue = value;
                        setState(() {});
                      },
                      value: _redValue,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      activeColor: Colors.red,
                      label: 'Red: $_redValue',
                    ),
                    verticalSpace20,
                    _buildSlider(
                      onChanged: (double value) {
                        _greenValue = value;
                        setState(() {});
                      },
                      value: _greenValue,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      activeColor: Colors.green,
                      label: 'Green: $_greenValue',
                    ),
                    verticalSpace20,
                    _buildSlider(
                      onChanged: (double value) {
                        _blueValue = value;
                        setState(() {});
                      },
                      value: _blueValue,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      activeColor: Colors.blue,
                      label: 'Blue: $_blueValue',
                    ),
                    verticalSpace20,
                    _buildSlider(
                      onChanged: (double value) {
                        _alphaValue = value;
                        setState(() {});
                      },
                      value: _alphaValue,
                      min: 0,
                      max: 255,
                      divisions: 255,
                      activeColor: Colors.black,
                      label: 'Opacity: $_alphaValue',
                    ),
                    verticalSpace20,
                    _buildRowValue(screenWidth),
                    verticalSpace20,
                    _buildContainer,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Slider _buildSlider({
    void Function(double) onChanged,
    double value,
    double min,
    double max,
    int divisions,
    Color activeColor,
    String label,
  }) {
    return Slider(
      onChanged: onChanged,
      value: value,
      min: min,
      max: max,
      divisions: divisions,
      activeColor: activeColor,
      inactiveColor: activeColor.withOpacity(0.24),
      label: label,
    );
  }

  Widget _buildRowValue(double width) {
    return width > 450
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRGBCard,
              SizedBox(
                width: 30,
              ),
              _buildHexCard,
            ],
          )
        : Center(
            child: Column(
              children: [
                _buildRGBCard,
                _buildHexCard,
              ],
            ),
          );
  }

  Widget get _buildRGBCard {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildColorColumn('Red', Colors.red, '$_redValue'),
            horizontalSpace5,
            _buildColorColumn('Green', Colors.green, '$_greenValue'),
            horizontalSpace5,
            _buildColorColumn('Blue', Colors.blue, '$_blueValue'),
            horizontalSpace5,
            _buildColorColumn('Opacity', Colors.black, '$_alphaValue'),
          ],
        ),
      ),
    );
  }

  Widget get _buildHexCard {
    String _final = _hexString.toUpperCase();

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Hex Code',
              style: TextStyle(color: Colors.blue),
            ),
            Text(_final),
          ],
        ),
      ),
    );
  }

  Widget _buildColorColumn(String title, Color color, String textColor) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: color,
          ),
        ),
        Text(textColor),
      ],
    );
  }

  Widget get _buildContainer {
    final String _final = _hexString;
    final int color = int.parse(_final);

    return Container(
      color: Color(color),
      width: 200,
      height: 50,
    );
  }

  SizedBox get verticalSpace5 {
    return SizedBox(height: 5);
  }

  SizedBox get verticalSpace20 {
    return SizedBox(height: 20);
  }

  SizedBox get horizontalSpace5 {
    return SizedBox(width: 5);
  }

  String get _hexString {
    String _red = _redValue.toInt().toRadixString(16).padLeft(2, '0');
    String _green = _greenValue.toInt().toRadixString(16).padLeft(2, '0');
    String _blue = _blueValue.toInt().toRadixString(16).padLeft(2, '0');
    String _alpha = _alphaValue.toInt().toRadixString(16).padLeft(2, '0');
    String _final = '0x$_alpha$_red$_green$_blue';
    return _final;
  }
}

