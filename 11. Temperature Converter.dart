import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: TemperatureConverter(),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double _inTemp;
  String _inUnit;
  String _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter Temperature',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Enter Temperature',
                      isDense: true,
                    ),
                    onChanged: (String value) {
                      _inTemp = double.tryParse(value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Unit Of Temperature',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButton<String>(
                    value: _inUnit,
                    items: _buildDropdownItems,
                    hint: Text('Enter Unit'),
                    isExpanded: true,
                    onChanged: (String value) {
                      _inUnit = value == 'Clear' ? null : value;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildTempChips(context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Result: ${_result ?? 0}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get _buildDropdownItems {
    final List<String> _units = ['Celsius', 'Fahrenheit', 'Kelvin'];
    List<DropdownMenuItem<String>> _items = _units.map(
      (unit) {
        return DropdownMenuItem<String>(
          child: Text(unit),
          value: unit,
        );
      },
    ).toList();
    _items.insert(
      0,
      DropdownMenuItem<String>(
        child: Text('Clear'),
        value: 'Clear',
      ),
    );
    return _items;
  }

  List<Widget> _buildTempChips(BuildContext context) {
    final List<String> _units = ['Celsius', 'Fahrenheit', 'Kelvin'];
    return _units.map(
      (unit) {
        return Material(
          elevation: 2,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: Colors.blue,
          child: InkWell(
            onTap: () {
              if (_inTemp == null) {
                _showAlertDialog(
                  context,
                  'Number is Invalid',
                  'Please enter a valid number',
                );
                return;
              }
              if (_inUnit == null) {
                _showAlertDialog(
                  context,
                  'Unit is not selected',
                  'Please select a input unit',
                );
                return;
              }

              _result = convertTemp(unit).toString();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(unit),
            ),
          ),
        );
      },
    ).toList();
  }

  double convertTemp(String outUnit) {
    double _output;
    double _temp;

    switch (_inUnit) {
      case 'Celsius':
        _temp = _inTemp + 273.15;
        break;
      case 'Fahrenheit':
        _temp = (_inTemp + 459.67) * 5 / 9;
        break;
      case 'Kelvin':
        _temp = _inTemp;
        break;
    }

    switch (outUnit) {
      case 'Celsius':
        _output = _temp - 273.15;
        break;
      case 'Fahrenheit':
        _output = _temp * 9 / 5 - 459.67;
        break;
      case 'Kelvin':
        _output = _temp;
        break;
    }

    return _output;
  }

  void _showAlertDialog(
    BuildContext context,
    String title,
    String body,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(body),
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
}

