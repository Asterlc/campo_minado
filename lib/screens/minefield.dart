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
  Board? _board;

  void _restartGame() {
    setState(() {
      _won = null;
      _board!.restartBoard();
    });
  }

  void _openGame(Field field) {
    setState(() {
      try {
        field.open();

        if (_board!.solvedAll) {
          _won = true;
        }
      } on ExplosionException {
        _won = false;
        _board!.showBombs();
      }
    });
  }

  void _changeFieldMark(Field field) {
    setState(() {
      field.changeMark();
    });
  }

  Board _getBoard(double width, double height) {
    if (_board == null) {
      int columns = 15;
      double fieldSize = (width / columns);
      int lines = (height / fieldSize).floor();

      _board = Board(lines: lines, columns: columns, bombs: 8);
    }
    return _board!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: ResultWidget(
            winner: _won,
            onRestart: _restartGame,
          ),
          body: Container(
            color: Colors.grey,
            child: LayoutBuilder(builder: (ctx, constraints) {
              return BoardWidget(
                board: _getBoard(constraints.maxWidth, constraints.maxHeight),
                onOpen: _openGame,
                onChangeMark: _changeFieldMark,
              );
            }),
          ),
        ));
  }
}
