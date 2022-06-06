import 'package:flutter_test/flutter_test.dart';
import 'package:campo_minado/models/board.dart';

main() {
  test('Game Won', () {
    Board board = Board(
      lines: 2,
      columns: 2,
      bombs: 0,
    );
    board.fields[0].markMining();
    board.fields[3].markMining();

    //Jogando
    board.fields[0].changeMark();
    board.fields[1].open();
    board.fields[2].open();
    board.fields[3].changeMark();

    expect(board.solvedAll, true);
  });
}
