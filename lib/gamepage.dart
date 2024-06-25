import 'package:flutter/material.dart';

import './gamedraw.dart';
import './gameover.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  static const String routeName = '/gamepage';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isCross = true; // if true then cross else circle
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => _tapped(index),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                ),
                child: Center(
                  child: Text(
                    displayXO[index],
                    style: TextStyle(
                      color: displayXO[index] == 'X'
                          ? Colors.orange
                          : Colors.blueAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (isCross) {
        displayXO[index] = 'X';
      } else {
        displayXO[index] = 'O';
      }
      isCross = !isCross;
      checkWinner();
    });
  }

  void checkWinner() {
    // row 1
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showWinPage(displayXO[0]);
      });
    }
    // row 2
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showWinPage(displayXO[3]);
      });
    }
    // row 3
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showWinPage(displayXO[6]);
      });
    }
    // col 1
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showWinPage(displayXO[0]);
      });
    }
    // col 2
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showWinPage(displayXO[1]);
      });
    }
    // col 3
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showWinPage(displayXO[2]);
      });
    }
    // diagonal 1
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showWinPage(displayXO[0]);
      });
    }
    // diagonal 2
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      Future.delayed(const Duration(milliseconds: 500), () {
        _showWinPage(displayXO[2]);
      });
    }
    // draw
    if (!displayXO.contains('')) {
      _showDrawDialog();
    }
  }

  void _showWinPage(String winner) {
    _clearBoard();
    Navigator.of(context).pushNamed(GameOver.routeName, arguments: winner);
  }

  void _showDrawDialog() {
    _clearBoard();
    Navigator.of(context).pushNamed(GameDraw.routeName);
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
  }
}
