import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:snake_game_dapp/controller.dart';
import 'snake_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake Xenzia dApp',
      // home: SnakeGame(),
      home: ChangeNotifierProvider<Controller>(
        create: (context) =>
            Controller(squaresPerRow: 20, squaresPerCol: 40, context: context),
        builder: (context, child) => SnakeGame(),
      ),
    );
  }
}
