import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Flutter Demo',
      home: Scaffold(
        body: CalculatorWidget(),
      ),
    );
  }
}

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String _current;
  String _prev;
  String _currentOperator = "";
  bool _flag = false;

  @override
  void initState() {
    super.initState();
    this._current = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        child: Container(
          width: 400,
          height: 800,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(8),
                  child: Text(
                    _current.toString(),
                    style: Theme.of(context).textTheme.headline2.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              ...buildCalculator,
              vSpacer,
              buildRow(
                widgets: [
                  GestureDetector(
                    onTap: () {
                      readButton("0");
                    },
                    child: Container(
                      width: 180,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(45),
                      ),
                      child: Center(
                        child: Text(
                          '0',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  buildButton(
                    buttonColor: Colors.grey[700],
                    onPressed: readButton,
                    buttonTitle: '.',
                    textColor: Colors.white,
                  ),
                  buildButton(
                    buttonColor: Colors.orange,
                    onPressed: (val) {
                      readButton("Equals");
                    },
                    buttonTitle: '=',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get buildCalculator {
    final List<List<ButtonModel>> buttonList = [
      [
        ButtonModel(
          buttonColor: Colors.grey,
          onPressed: (val) {
            readButton("Clear");
          },
          buttonTitle: 'AC',
          textColor: Colors.black,
        ),
        ButtonModel(
          buttonColor: Colors.grey,
          onPressed: (val) {
            readButton("Negate");
          },
          buttonTitle: '+/-',
          textColor: Colors.black,
        ),
        ButtonModel(
          buttonColor: Colors.grey,
          onPressed: (val) {
            readButton("Percentage");
          },
          buttonTitle: '%',
          textColor: Colors.black,
        ),
        ButtonModel(
          buttonColor: Colors.orange,
          onPressed: (val) {
            readButton("Divide");
          },
          buttonTitle: '/',
          textColor: Colors.white,
        ),
      ],
      [
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '7',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '8',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '9',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.orange,
          onPressed: (val) {
            readButton("Multiply");
          },
          buttonTitle: 'x',
          textColor: Colors.white,
        ),
      ],
      [
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '4',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '5',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '6',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.orange,
          onPressed: (val) {
            readButton("Minus");
          },
          buttonTitle: '-',
          textColor: Colors.white,
        ),
      ],
      [
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '1',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '2',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.grey[700],
          onPressed: readButton,
          buttonTitle: '3',
          textColor: Colors.white,
        ),
        ButtonModel(
          buttonColor: Colors.orange,
          onPressed: (val) {
            readButton("Plus");
          },
          buttonTitle: '+',
          textColor: Colors.white,
        ),
      ]
    ];

    return buttonList
        .map(
          (e) => buildRow(
            widgets: e
                .map(
                  (e) => buildButton(
                    buttonColor: e.buttonColor,
                    onPressed: e.onPressed,
                    buttonTitle: e.buttonTitle,
                    textColor: e.textColor,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }

  Widget buildRow({@required List<Widget> widgets}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets,
    );
  }

  Widget buildButton({
    @required Color buttonColor,
    @required Function(String val) onPressed,
    @required String buttonTitle,
    @required Color textColor,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () => onPressed(buttonTitle),
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Center(
            child: Text(
              buttonTitle,
              style: TextStyle(
                fontSize: 24,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox get vSpacer => SizedBox(height: 16);

  void readButton(String button) {
    String output = "";
    String input = _current;

    if (button == "Clear") {
      output = "0";
      _prev = "0";
      _flag = false;
      _currentOperator = "";
      updateOutput(output);
      return;
    }

    if (button == "Negate") {
      if (_currentOperator == "") {
        output = (-1 * input.toNum()).toString();
      } else {
        output = equate(input);
        output = (-1 * input.toNum()).toString();
      }
      updateOutput(output);
      return;
    }

    if (button == "Percentage") {
      if (_currentOperator == "") {
        output = (input.toNum() / 100).toString();
      } else {
        output = (equate(input).toNum() / 100).toString();
      }
      updateOutput(output);
      return;
    }

    if (button.isOperator) {
      if (_currentOperator == "") {
        output = input;
      } else {
        output = equate(input);
      }
      _prev = output;
      _currentOperator = button;
      _flag = true;
      updateOutput(output);
      return;
    }

    if (button == ".") {
      if (!input.contains(".")) {
        output = input + ".";
        updateOutput(output);
        return;
      }
    }

    if (button.isNumber) {
      String result;
      if (!_flag) {
        if (input.contains(".")) {
          result = (input + button);
        } else {
          result = (_current == "0" ? button : _current + button);
        }

        output = result.toString();
        updateOutput(output);
      } else {
        updateOutput(button);
        _flag = false;
      }
      return;
    }

    if (button == "Equals") {
      output = equate(input);
      updateOutput(output);
      return;
    }
  }

  String equate(String input) {
    num result = 0;
    num operand = _prev.toNum();
    switch (_currentOperator) {
      case "Multiply":
        result = operand * input.toNum();
        break;
      case "Plus":
        result = operand + input.toNum();
        break;
      case "Minus":
        result = operand - input.toNum();
        break;
      case "Divide":
        result = operand / input.toNum();
        break;
      default:
        result = input.toNum();
    }
    print(result);
    String temp = result.toStringAsPrecision(
      result.toString().length > 10 ? 10 : result.toString().length,
    );
    if (temp.contains(".")) {
      int index;
      for (int i = temp.length - 1; i > 0; i--) {
        if (temp[i] != "0") {
          index = i;
          break;
        }
      }
      temp = temp.substring(0, index + 1);
    }
    print(temp);
    _prev = temp;
    _currentOperator = "";
    updateOutput(temp);
    return temp;
  }

  void updateOutput(String output) {
    _current = output;
    setState(() {});
  }
}

extension Operator on String {
  bool get isOperator {
    if (this == "Divide") return true;
    if (this == "Multiply") return true;
    if (this == "Plus") return true;
    if (this == "Minus") return true;
    return false;
  }
}

extension NumberValue on String {
  bool get isNumber {
    if (this == "0") return true;
    if (this == "1") return true;
    if (this == "2") return true;
    if (this == "3") return true;
    if (this == "4") return true;
    if (this == "5") return true;
    if (this == "6") return true;
    if (this == "7") return true;
    if (this == "8") return true;
    if (this == "9") return true;
    return false;
  }
}

extension ToNum on String {
  num toNum() {
    return num.parse(this);
  }
}

class ButtonModel {
  final Color buttonColor;
  final Color textColor;
  final String buttonTitle;
  final Function(String value) onPressed;

  ButtonModel({
    @required this.buttonColor,
    @required this.textColor,
    @required this.buttonTitle,
    @required this.onPressed,
  });
}
