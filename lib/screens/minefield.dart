import 'package:campo_minado/components/field.widget.dart';
import 'package:campo_minado/models/board.dart';
import 'package:flutter/material.dart';
import '../components/result.widget.dart';
import '../models/field.dart';
import '../models/explosion_exception.dart';
import '../components/board.widget.dart';

class MineField extends StatefulWidget {
  @override
  State<MineField> createState() => _MineFieldState();
}

class _MineFieldState extends State<MineField> {
  // const MyWidget({Key? key}) : super(key: key);
  bool? _won;
  Board _board = Board(
    lines: 12,
    columns: 12,
    bombs: 3,
  );

  void _restartGame() {
    setState(() {
      _won = null;
      _board.restartBoard();
    });
  }

  void _openGame(Field field) {
    setState(() {
      try {
        field.open();

        if (_board.solvedAll) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board.showBombs();
      }
    });
  }

  void _changeFieldMark(Field field) {
    setState(() {
      field.changeMark();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: ResultWidget(
        winner: _won,
        onRestart: _restartGame,
      ),
      body: Container(
        child: BoardWidget(
          board: _board,
          onOpen: _openGame,
          onChangeMark: _changeFieldMark,
        ),
      ),
    ));
  }
}
