import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snake_game_dapp/contract_linker.dart';
import 'package:snake_game_dapp/direction.dart';

class Controller with ChangeNotifier {
  final int squaresPerRow;
  final int squaresPerCol;
  final randomGen = Random();
  var snake = [
    [0, 0],
    [0, 1]
  ];
  BuildContext context;
  bool isPlaying = false;
  var food = [0, 2];
  Direction direction = Direction.up;
  late ContractLinker contractLinker;

  Controller(
      {required this.squaresPerRow,
      required this.squaresPerCol,
      required this.context}) {
    contractLinker = ContractLinker();
  }

  void startGame() {
    direction = Direction.up;
    const duration = Duration(milliseconds: 200);

    snake = [
      // Snake head
      [(squaresPerRow / 2).floor(), (squaresPerCol / 2).floor()]
    ];

    snake.add([snake.first[0], snake.first[1] + 1]); // Snake body

    createFood();

    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      moveSnake();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
    contractLinker.startGame();
    notifyListeners();
  }

  void moveSnake() {
    switch (direction) {
      case Direction.up:
        snake.insert(0, [snake.first[0], snake.first[1] - 1]);
        break;

      case Direction.down:
        snake.insert(0, [snake.first[0], snake.first[1] + 1]);
        break;

      case Direction.left:
        snake.insert(0, [snake.first[0] - 1, snake.first[1]]);
        break;

      case Direction.right:
        snake.insert(0, [snake.first[0] + 1, snake.first[1]]);
        break;
    }

    if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
      snake.removeLast();
    } else {
      createFood();
    }
    notifyListeners();
  }

  void createFood() {
    food = [randomGen.nextInt(squaresPerRow), randomGen.nextInt(squaresPerCol)];
    notifyListeners();
  }

  bool checkGameOver() {
    if (!isPlaying ||
        snake.first[1] < 0 ||
        snake.first[1] >= squaresPerCol ||
        snake.first[0] < 0 ||
        snake.first[0] > squaresPerRow) {
      return true;
    }

    for (int i = 1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][1] == snake.first[1]) {
        return true;
      }
    }

    return false;
  }

  void endGame() {
    isPlaying = false;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Game Over'),
            content: Text(
              'Score: ${snake.length - 2}',
              style: const TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
    contractLinker.endGame();
    notifyListeners();
  }
}
