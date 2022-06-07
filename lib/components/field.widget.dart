import 'package:flutter/material.dart';
import '../models/field.dart';

class FieldWidget extends StatelessWidget {
  // const FieldWidget({Key? key}) : super(key: key);

  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onChangeMark;

  FieldWidget({
    required this.field,
    required this.onOpen,
    required this.onChangeMark,
  });

  Widget _getImage() {
    int bombsAround = field.bombsAround;

    if (field.openGet && field.miningGet && field.isBoomGet) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (field.openGet && field.miningGet) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (field.openGet && bombsAround > 0) {
      return Image.asset('assets/images/aberto_$bombsAround.jpeg');
    } else if (field.openGet) {
      return Image.asset('assets/images/aberto_0.jpeg');
    } else if (field.markedGet) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onOpen(field),
        onLongPress: () => onChangeMark(field),
        child: _getImage());
  }
}
