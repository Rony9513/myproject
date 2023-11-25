import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameSelectionScreen(),
    );
  }
}

class GameSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Selection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NumberGuessingGame()),
                );
              },
              child: Text('Number Guessing Game'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicTacToeGame()),
                );
              },
              child: Text('Tic-Tac-Toe Game'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MouseSpeedGame()),
                );
              },
              child: Text('Mouse Speed Game'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordGuessingGame()),
                );
              },
              child: Text('Word Guessing Game'),
            ),
          ],
        ),
      ),
    );
  }
}
  // Word Guessing Game
  class WordGuessingGame extends StatefulWidget {
  @override
  _WordGuessingGameState createState() => _WordGuessingGameState();
  }

  class _WordGuessingGameState extends State<WordGuessingGame> {
  late String targetWord;
  TextEditingController _guessController = TextEditingController();
  String? feedback;

  List<String> words = ['flutter', 'dart', 'widget', 'mobile', 'app'];

  @override
  void initState() {
  super.initState();
  startNewGame();
  }

  void startNewGame() {
  setState(() {
  targetWord = words[Random().nextInt(words.length)];
  feedback = null;
  _guessController.text = '';
  });
  }

  void makeGuess() {
  String guess = _guessController.text.toLowerCase();

  setState(() {
  if (guess == targetWord) {
  feedback = 'Congratulations! You guessed the correct word.';
  } else {
  feedback = 'Try again.';
  }
  });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
  title: Text('Word Guessing Game'),
  ),
  body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  Text(
  'Guess the Word',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  ),
  SizedBox(height: 20),
  if (feedback != null)
  Container(
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(
  color: Colors.orangeAccent,
  borderRadius: BorderRadius.circular(15),
  ),
  child: Text(
  feedback!,
  style: TextStyle(fontSize: 18, color: Colors.orange),
  textAlign: TextAlign.center,
  ),
  ),
  SizedBox(height: 20),
  Container(
  width: 200,
  child: TextField(
  controller: _guessController,
  textAlign: TextAlign.center,
  style: TextStyle(fontSize: 18),
  decoration: InputDecoration(
  hintText: 'Enter your guess',
  border: OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  ),
  filled: true,
  fillColor: Colors.orange.shade50,
  ),
  ),
  ),
  SizedBox(height: 20),
  ElevatedButton(
  onPressed: () {
  makeGuess();
  },
  child: Text(
  'Submit Guess',
  style: TextStyle(fontSize: 16),
  ),
  style: ElevatedButton.styleFrom(
  primary: Colors.orange,
  onPrimary: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15),
  ),
  ),
  ),
  SizedBox(height: 10),
  ElevatedButton(
  onPressed: () {
  startNewGame();
  },
  child: Text(
  'Start New Game',
  style: TextStyle(fontSize: 16),
  ),
  style: ElevatedButton.styleFrom(
  primary: Colors.red,
  onPrimary: Colors.white,
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15),
  ),
  ),
  ),
  ],
  ),
  ),
  );
  }
  }

// Number Guessing Game
class NumberGuessingGame extends StatefulWidget {
  @override
  _NumberGuessingGameState createState() => _NumberGuessingGameState();
}

class _NumberGuessingGameState extends State<NumberGuessingGame> {
  late int targetNumber;
  TextEditingController _guessController = TextEditingController();
  String? feedback;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      targetNumber = Random().nextInt(100) + 1;
      feedback = null;
      _guessController.text = '';
    });
  }

  void makeGuess() {
    int guess = int.tryParse(_guessController.text) ?? 0;

    setState(() {
      if (guess == targetNumber) {
        feedback = 'Congratulations! You guessed the correct number.';
      } else if (guess < targetNumber) {
        feedback = 'Try a higher number.';
      } else {
        feedback = 'Try a lower number.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Guessing Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Guess the Number (1-100)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (feedback != null)
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  feedback!,
                  style: TextStyle(fontSize: 18, color: Colors.teal),
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(height: 20),
            Container(
              width: 200,
              child: TextField(
                controller: _guessController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: 'Enter your guess',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.teal.shade50,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                makeGuess();
              },
              child: Text(
                'Submit Guess',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                startNewGame();
              },
              child: Text(
                'Start New Game',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tic-Tac-Toe Game
class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));

  bool isPlayerX = true; // true for X, false for O
  bool gameFinished = false;
  String winner = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe Game'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Colors.indigo],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                gameFinished
                    ? (winner.isNotEmpty ? 'Player $winner wins!' : 'It\'s a tie!')
                    : 'Player ${isPlayerX ? 'X' : 'O'}\'s turn',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              Column(
                children: List.generate(3, (row) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (col) {
                      return GestureDetector(
                        onTap: () {
                          if (!gameFinished && board[row][col].isEmpty) {
                            setState(() {
                              board[row][col] = isPlayerX ? 'X' : 'O';
                              isPlayerX = !isPlayerX;
                              checkWinner();
                            });
                          }
                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.7),
                          ),
                          child: Center(
                            child: Text(
                              board[row][col],
                              style: TextStyle(fontSize: 32, color: Colors.deepPurple),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: resetGame,
                child: Text(
                  'Reset Game',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkWinner() {
    // Check rows, columns, and diagonals for a winner
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0].isNotEmpty) {
        declareWinner(board[i][0]);
        return;
      }
      if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i].isNotEmpty) {
        declareWinner(board[0][i]);
        return;
      }
    }

    if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0].isNotEmpty) {
      declareWinner(board[0][0]);
      return;
    }

    if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2].isNotEmpty) {
      declareWinner(board[0][2]);
      return;
    }

    // Check for a tie
    if (!board.any((row) => row.any((cell) => cell.isEmpty))) {
      declareWinner('');
    }
  }

  void declareWinner(String symbol) {
    setState(() {
      gameFinished = true;
      winner = symbol;
    });
  }

  void resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      isPlayerX = true;
      gameFinished = false;
      winner = '';
    });
  }
}

// Mouse Speed Game
class MouseSpeedGame extends StatefulWidget {
  @override
  _MouseSpeedGameState createState() => _MouseSpeedGameState();
}

class _MouseSpeedGameState extends State<MouseSpeedGame> {
  double time = 10.0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    startGameTimer();
  }

  void startGameTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      setState(() {
        if (time < 1) {
          timer.cancel();
          showGameOverDialog();
        } else {
          time -= 1;
        }
      });
    });
  }

  void handleTap() {
    setState(() {
      score += 1;
    });
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Your score: $score", style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text("Can you beat your high score?", style: TextStyle(fontSize: 16)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                checkHighScore();
              },
              child: Text("Play Again"),
            ),
          ],
        );
      },
    );
  }

  void checkHighScore() {
    int savedScore = 0; // Retrieve the saved score from a storage mechanism (e.g., SharedPreferences)
    if (score > savedScore) {
      // Update the saved score
      // For simplicity, we're not saving the score here; you can use a storage mechanism like SharedPreferences for this purpose
      savedScore = score;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SavedScorePage(highestScore: savedScore),
      ),
    );

    resetGame();
  }

  void resetGame() {
    setState(() {
      time = 10.0;
      score = 0;
    });
    startGameTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mouse Speed Game'),
        actions: [
          IconButton(
            icon: Icon(Icons.leaderboard),
            onPressed: () {
              checkHighScore();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Time: ${time.toInt()}s',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Score: $score',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: handleTap,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    'Tap me!',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SavedScorePage extends StatelessWidget {
  final int highestScore;

  SavedScorePage({required this.highestScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Highest Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star,
              size: 80,
              color: Colors.amber,
            ),
            SizedBox(height: 20),
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You achieved a new high score:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              '$highestScore',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              child: Text(
                'Back to Game',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
