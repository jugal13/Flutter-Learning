import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: RockPaperScissors(),
    );
  }
}

class RockPaperScissors extends StatefulWidget {
  @override
  _RockPaperScissorsState createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  final TextStyle heading = TextStyle(fontSize: 24);
  final TextStyle body = TextStyle(fontSize: 20);
  final TextStyle choiceStyle = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.underline,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  String userChoice;
  String compChoice;
  String result;
  int userScore;
  int compScore;

  @override
  void initState() {
    super.initState();
    userScore = 0;
    compScore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Container(
            width: 300,
            child: Card(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          'Rock Paper Scissors',
                          style: heading,
                        ),
                      ),
                      vSpacer20,
                      Container(
                        width: double.infinity,
                        height: 75,
                        child: Row(
                          children: [
                            hSpacer10,
                            buildContainer(userChoice),
                            Expanded(
                              child: Stack(
                                children: [
                                  buildScoreCard,
                                  userCard,
                                  computerCard,
                                ],
                              ),
                            ),
                            buildContainer(compChoice),
                            hSpacer10,
                          ],
                        ),
                      ),
                      vSpacer20,
                      Container(
                        height: 24,
                        child: Text(
                          result ?? 'Play',
                          style: heading,
                        ),
                      ),
                      vSpacer20,
                      Text(
                        'Make Your Choice',
                        style: choiceStyle,
                      ),
                      vSpacer10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildButton('Rock'),
                          buildButton('Paper'),
                          buildButton('Scissors'),
                        ],
                      ),
                      vSpacer10,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String choice) {
    return Container(
      height: 24,
      child: Text(
        choice ?? '',
        style: body,
      ),
    );
  }

  Widget get buildScoreCard {
    return Center(
      child: Container(
        width: 125,
        height: 65,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              userScore.toString(),
              style: heading,
            ),
            Text(
              ':',
              style: heading,
            ),
            Text(
              compScore.toString(),
              style: heading,
            ),
          ],
        ),
      ),
    );
  }

  Widget get userCard {
    return Center(
      child: SizedBox(
        width: 185,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 45,
            height: 25,
            color: Colors.red,
            child: Center(
              child: Text(
                'User',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get computerCard {
    return Center(
      child: SizedBox(
        width: 185,
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 45,
            height: 25,
            color: Colors.red,
            child: Center(
              child: Text(
                'Comp',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButton(String title) {
    return ButtonTheme(
      minWidth: 0,
      child: RaisedButton(
        onPressed: () {
          updateResult(title[0]);
        },
        child: Text(title),
      ),
    );
  }

  SizedBox get vSpacer10 => SizedBox(height: 10);
  SizedBox get hSpacer10 => SizedBox(width: 10);
  SizedBox get vSpacer20 => SizedBox(height: 20);

  void updateResult(String choice) {
    List<String> choices = ['R', 'P', 'S'];
    Random random = Random();
    compChoice = choices[random.nextInt(3)];
    userChoice = choice;
    result = 'Draw';
    switch (userChoice) {
      case 'R':
        switch (compChoice) {
          case 'P':
            result = 'Lost';
            compScore += 1;
            break;
          case 'S':
            result = 'Won';
            userScore += 1;
            break;
        }
        break;
      case 'P':
        switch (compChoice) {
          case 'R':
            result = 'Won';
            userScore += 1;
            break;
          case 'S':
            result = 'Lost';
            compScore += 1;
            break;
        }
        break;
      case 'S':
        switch (compChoice) {
          case 'P':
            result = 'Won';
            userScore += 1;
            break;
          case 'R':
            result = 'Lost';
            compScore += 1;
            break;
        }
        break;
    }
    setState(() {});
  }
}

