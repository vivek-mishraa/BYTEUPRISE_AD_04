import 'package:flutter/material.dart';

import './gamedraw.dart';
import './gameover.dart';
import './gamepage.dart';
import './homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        GamePage.routeName: (context) => const GamePage(),
        GameOver.routeName: (context) => const GameOver(),
        GameDraw.routeName: (context) => const GameDraw(),
      },
    );
  }
}
