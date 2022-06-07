import 'package:campo_minado/components/field.widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import '../models/board.dart';
import '../models/field.dart';

class BoardWidget extends StatelessWidget {
  // const BoardWidget({Key? key}) : super(key: key);

  final Board board;
  final void Function(Field) onOpen;
  final void Function(Field) onChangeMark;

  const BoardWidget({
    required this.board,
    required this.onOpen,
    required this.onChangeMark,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.count(
      crossAxisCount: board.columns,
      children: board.fields.map((e) {
        return FieldWidget(
          field: e,
          onOpen: onOpen,
          onChangeMark: onChangeMark,
        );
      }).toList(),
    ));
  }
}
