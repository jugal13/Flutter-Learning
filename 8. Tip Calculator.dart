import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  double _amount;
  int _tipPercentage;
  int _numberOfPeople;

  @override
  void initState() {
    super.initState();
    _amount = 0;
    _tipPercentage = 0;
    _numberOfPeople = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Bill Total',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                color: Colors.blue,
                              ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Enter Amount',
                            ),
                            onChanged: (value) {
                              _amount = double.tryParse(value) == null
                                  ? 0
                                  : double.tryParse(value);
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Tip',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildCounter(
                          '$_tipPercentage%',
                          () {
                            if (_tipPercentage > 0) _tipPercentage -= 1;
                            setState(() {});
                          },
                          () {
                            if (_tipPercentage < 100) _tipPercentage += 1;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Split',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.blue, fontSize: 18),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildCounter(
                          '$_numberOfPeople',
                          () {
                            if (_numberOfPeople > 1) _numberOfPeople -= 1;
                            setState(() {});
                          },
                          () {
                            _numberOfPeople += 1;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Each Bill',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.blue,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              getEachBill,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Each Tip',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.blue,
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              getEachTip,
                              style: Theme.of(context).textTheme.headline6,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Each Total',
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: Colors.blue,
                              ),
                        ),
                        Text(
                          getEachTotal,
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCounter(
      String value, Function() decrement, Function() increment) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: decrement,
          child: Icon(
            Icons.remove,
            size: 30,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.blue,
              ),
        ),
        GestureDetector(
          onTap: increment,
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ],
    );
  }

  String get getEachBill {
    double amt = _amount / _numberOfPeople;
    return amt.toStringAsFixed(2);
  }

  String get getEachTip {
    double amt = (_amount * _tipPercentage / 100) / _numberOfPeople;
    return amt.toStringAsFixed(2);
  }

  String get getEachTotal {
    double amt = (_amount + _amount * _tipPercentage / 100) / _numberOfPeople;
    return amt.toStringAsFixed(2);
  }
}

