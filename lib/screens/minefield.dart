import 'package:campo_minado/components/field.widget.dart';
import 'package:flutter/material.dart';
import '../components/result.widget.dart';
import '../models/field.dart';
import '../models/explosion_exception.dart';

class MineField extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  // _restartGame() {
  //   print('Restart game');
  //   return;
  // }

  void _openGame(Field field) {
    print('open game');
  }

  void _changeFieldMark(Field field) {
    print('change marks');
  }

  @override
  Widget build(BuildContext context) {
    Field testField2 = Field(line: 1, column: 0);
    testField2.markMining();

    Field testField = Field(line: 0, column: 0);

    testField.addNeighbor(testField2);

    try {
      // testField.markMining();
      testField.changeMark();
      // testField.open();
    } on ExplosionException {}

    return MaterialApp(
        home: Scaffold(
      appBar: ResultWidget(
        winner: false,
        onRestart: () => {{}},
      ),
      body: Container(
        child: FieldWidget(
          field: testField,
          onOpen: _openGame,
          onChangeMark: _changeFieldMark,
        ),
      ),
    ));
  }
}
