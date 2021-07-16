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
        body: TicTacToeWidget(),
      ),
    );
  }
}

class TicTacToeWidget extends StatefulWidget {
  @override
  _TicTacToeWidgetState createState() => _TicTacToeWidgetState();
}

class _TicTacToeWidgetState extends State<TicTacToeWidget> {
  final TextStyle playerTextStyle = TextStyle(fontSize: 24);
  final TextStyle scoreTextStyle = TextStyle(fontSize: 32);

  List<String> gameState = List.generate(9, (index) => '');
  String currentPlayer = "X";
  String winner = "";
  bool player1 = true;
  bool gameEnded = false;
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = screenWidth > 500 ? 500 : screenWidth;
    return Center(
      child: Container(
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Player 1 (X)",
                          style: playerTextStyle.copyWith(
                            color: player1 && !gameEnded
                                ? Colors.amber
                                : Colors.white,
                          ),
                        ),
                        Text(
                          player1Score.toString(),
                          style: scoreTextStyle,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Player 2 (O)",
                          style: playerTextStyle.copyWith(
                            color: !player1 && !gameEnded
                                ? Colors.amber
                                : Colors.white,
                          ),
                        ),
                        Text(
                          player2Score.toString(),
                          style: scoreTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 16),
                shrinkWrap: true,
                crossAxisCount: 3,
                children: List.generate(
                  9,
                  (index) => BoxWidget(
                    index: index,
                    playedValue: gameState.elementAt(index),
                    onTap: () {
                      if (gameState.elementAt(index) == "" && !gameEnded) {
                        gameState[index] = currentPlayer;
                        winner = currentPlayer;
                        currentPlayer = currentPlayer == "X" ? "O" : "X";
                        player1 = !player1;
                        bool result = checkWinner();
                        if (result) {
                          gameEnded = true;
                        }
                        else if (!gameState.contains("")) {
                          gameEnded = true;
                          winner = "Draw";
                        }
                        if (gameEnded) {
                          Future.delayed(Duration(seconds: 1), () {
                            restartGame();
                          });
                        }
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              Center(
                child: Text(
                  getCurrentStatus,
                  style: playerTextStyle,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: resetGame,
                  child: Text("Restart Game"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String get getCurrentStatus {
    if (gameEnded && winner == "Draw") return "Game ended in a draw";

    if (gameEnded) {
      if (winner == "X") {
        player1Score += 1;
      } else {
        player2Score += 1;
      }

      return winner == "X" ? "Player 1 has won" : "Player 2 has won";
    }

    if (currentPlayer == "X") return "Player 1's turn";

    if (currentPlayer == "O") return "Player 2's turn";

    return "";
  }

  bool checkWinner() {
    List<List<int>> winningStates = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];
    for (int i = 0; i < winningStates.length; i++) {
      String first = gameState.elementAt(winningStates[i][0]);
      String second = gameState.elementAt(winningStates[i][1]);
      String third = gameState.elementAt(winningStates[i][2]);
      if (first == "" || second == "" || third == "") continue;
      if (first == second && second == third) return true;
    }
    return false;
  }

  void restartGame() {
    gameEnded = false;
    currentPlayer = currentPlayer == "O" ? "O" : "X";
    player1 = currentPlayer == "X";
    winner = "";
    gameState = List.generate(9, (index) => "");
    setState(() {});
  }

  void resetGame() {
    gameEnded = false;
    currentPlayer = "X";
    player1 = true;
    winner = "";
    gameState = List.generate(9, (index) => "");
    player1Score = 0;
    player2Score = 0;
    setState(() {});
  }
}

class BoxWidget extends StatelessWidget {
  final BorderSide _borderSide = BorderSide(
    color: Colors.amber,
    width: 5.0,
    style: BorderStyle.solid,
  );

  final int index;
  final String playedValue;
  final Function() onTap;

  BoxWidget({
    @required this.index,
    @required this.playedValue,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          border: getBorder(index),
        ),
        child: Center(
          child: Text(
            playedValue,
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  BoxBorder getBorder(index) {
    switch (index) {
      case 0:
        return Border(bottom: _borderSide);
      case 1:
        return Border(
          left: _borderSide,
          bottom: _borderSide,
        );
      case 2:
        return Border(
          left: _borderSide,
          bottom: _borderSide,
        );
      case 3:
        return Border(bottom: _borderSide);
      case 4:
        return Border(
          left: _borderSide,
          bottom: _borderSide,
        );
      case 5:
        return Border(
          left: _borderSide,
          bottom: _borderSide,
        );
      case 6:
        return null;
      case 7:
        return Border(left: _borderSide);
      case 8:
        return Border(left: _borderSide);
      default:
        return null;
    }
  }
}
