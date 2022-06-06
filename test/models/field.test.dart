import 'package:flutter_test/flutter_test.dart';
import 'package:campo_minado/models/field.dart';

void main() {
  group('Field Test:', () {
    test('Open a boom field', () {
      Field f = Field(line: 0, column: 0);

      f.markMining();

      expect(() => f.open(), throwsException);
    });

    test('Open field without boom', () {
      Field f = Field(line: 0, column: 0);

      f.open();

      expect(f.openGet, true);
    });

    test('no neighbor', () {
      Field c1 = Field(line: 0, column: 0);
      Field c2 = Field(line: 1, column: 3);

      c1.addNeighbor(c2);
      expect(c1.neighbors.isEmpty, true);
    });

    test('Add neighbor', () {
      Field c1 = Field(line: 3, column: 3);
      Field c2 = Field(line: 3, column: 4);
      print('c2:>> $c2');
      Field c3 = Field(line: 2, column: 2);
      Field c4 = Field(line: 4, column: 4);

      c1.addNeighbor(c2);
      c1.addNeighbor(c3);
      c1.addNeighbor(c4);
      print('length :>> ${c1.neighbors.length}');
      expect(c1.neighbors.length, 3);
    });
  });
}
