
import 'package:flutter/material.dart';
import 'package:snake_game_dapp/direction.dart';
import 'package:provider/provider.dart';

import 'controller.dart';

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final int squaresPerRow = 20;
  final int squaresPerCol = 40;
  final fontStyle = const TextStyle(color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<Controller>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (controller.direction != Direction.up && details.delta.dy > 0) {
                  controller.direction = Direction.down;
                } else if (controller.direction != Direction.down && details.delta.dy < 0) {
                  controller.direction = Direction.up;
                }
              },
              onHorizontalDragUpdate: (details) {
                if (controller.direction != Direction.left && details.delta.dx > 0) {
                  controller.direction = Direction.right;
                } else if (controller.direction != Direction.right && details.delta.dx < 0) {
                  controller.direction = Direction.left;
                }
              },
              child: AspectRatio(
                aspectRatio: squaresPerRow / (squaresPerCol + 5),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: squaresPerRow,
                    ),
                    itemCount: squaresPerRow * squaresPerCol,
                    itemBuilder: (BuildContext context, int index) {
                      Color? color;
                      var x = index % squaresPerRow;
                      var y = (index / squaresPerRow).floor();

                      bool isSnakeBody = false;
                      for (var pos in controller.snake) {
                        if (pos[0] == x && pos[1] == y) {
                          isSnakeBody = true;
                          break;
                        }
                      }

                      if (controller.snake.first[0] == x && controller.snake.first[1] == y) {
                        color = Colors.green;
                      } else if (isSnakeBody) {
                        color = Colors.green[200];
                      } else if (controller.food[0] == x && controller.food[1] == y) {
                        color = Colors.red;
                      } else {
                        color = Colors.grey[800];
                      }

                      return Container(
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      // color: isPlaying ? Colors.red : Colors.blue,
                      child: Text(
                        controller.isPlaying ? 'End' : 'Start',
                        style: fontStyle,
                      ),
                      onPressed: () {
                        if (controller.isPlaying) {
                          controller.isPlaying = false;
                        } else {
                          controller.startGame();
                        }
                      }),
                  Text(
                    'Score: ${controller.snake.length - 2}',
                    style: fontStyle,
                  ),
                ],
              )),
        ],
      ),
    );

  }
}
