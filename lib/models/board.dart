import 'package:flutter/foundation.dart';
import 'field.dart';
import 'dart:math';

class Board {
  final int lines;
  final int columns;
  final int bombs;

  final List<Field> _fields = [];

  Board({required this.lines, required this.columns, required this.bombs}) {
    _createFields();
    _relatedNeighbors();
    _raffleBombs();
  }

  void restartBoard() {
    _fields.forEach((element) {
      element.restart();
    });
    _raffleBombs();
  }

  void showBombs() {
    _fields.forEach((element) {
      element.showBombs();
    });
  }

  void _createFields() {
    for (int l = 0; l < lines; l++) {
      for (int c = 0; c < columns; c++) {
        _fields.add(Field(line: l, column: c));
      }
    }
  }

  void _relatedNeighbors() {
    for (var field in _fields) {
      for (var neighbor in _fields) {
        field.addNeighbor(neighbor);
      }
    }
  }

  void _raffleBombs() {
    int raffles = 0;
    if (bombs > (lines * columns)) {
      return;
    }

    while (raffles < bombs) {
      int i = Random().nextInt(_fields.length);

      if (!_fields[i].miningGet) {
        raffles++;
        _fields[i].markMining();
      }
    }
  }

  List<Field> get fields {
    return _fields;
  }

  bool get solvedAll {
    return _fields.every((element) => element.solved);
  }
}
