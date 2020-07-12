import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: NumberConverter(),
    );
  }
}

class NumberConverter extends StatefulWidget {
  @override
  _NumberConverterState createState() => _NumberConverterState();
}

class _NumberConverterState extends State<NumberConverter> {
  String _number;
  int _base;
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
                    'Enter Number',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      labelText: 'Enter Number',
                    ),
                    onChanged: (value) {
                      _number = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Base',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  DropdownButton<int>(
                    value: _base,
                    items: _buildDropdownItems,
                    hint: Text(
                      'Enter base',
                    ),
                    isExpanded: true,
                    onChanged: (value) {
                      _base = value == 0 ? null : value;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildNumberChips(context),
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

  List<DropdownMenuItem<int>> get _buildDropdownItems {
    final List<int> _numbers = [
      2,
      8,
      10,
      16,
    ];
    final List<DropdownMenuItem<int>> _items = _numbers.map((number) {
      return DropdownMenuItem<int>(
        child: Text('$number'),
        value: number,
      );
    }).toList();
    _items.insert(
      0,
      DropdownMenuItem<int>(
        child: Text('Clear'),
        value: 0,
      ),
    );
    return _items;
  }

  List<Widget> _buildNumberChips(BuildContext context) {
    final Map<String, int> _weights = {
      'Binary': 2,
      'Octal': 8,
      'Decimal': 10,
      'Hexa': 16,
    };
    final List<String> _weightStrings = [
      'Binary',
      'Octal',
      'Decimal',
      'Hexa',
    ];
    return _weightStrings.map((weight) {
      return Material(
        elevation: 2,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            if (_number == null) {
              _showAlertDialog(
                  context, 'Number is Empty', 'Please enter a number');
              return;
            }
            if (_base == null) {
              _showAlertDialog(context, 'Base is Empty', 'Please enter a base');
              return;
            }
            if (!isValid(_number, _base)) {
              _showAlertDialog(
                context,
                'Number is incorrect',
                'Please enter a valid number for the entered base',
              );
              return;
            }
            final int outRadix = _weights[weight];
            _result = convertValue(_number, _base, outRadix);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(weight),
          ),
        ),
      );
    }).toList();
  }

  String convertValue(String value, int inRadix, int outRadix) {
    int number = int.parse(
      value,
      radix: inRadix,
    );
    return number.toRadixString(outRadix);
  }

  bool isValid(String value, int radix) {
    RegExp regex;
    switch (radix) {
      case 2:
        regex = RegExp('[0-1]');
        break;
      case 8:
        regex = RegExp('[0-7]');
        break;
      case 10:
        regex = RegExp('[0-9]');
        break;
      case 16:
        regex = RegExp('[0-9 A-F a-f]');
        break;
    }
    int len = regex.allMatches(value).map((e) => e.group(0)).toList().length;
    return len == value.length;
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

