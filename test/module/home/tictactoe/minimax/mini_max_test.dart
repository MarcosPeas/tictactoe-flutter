import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/modules/home/minimax/mini_max.dart';
import 'package:tictactoe/modules/home/tictactoe/board.dart';

void main() {
  test('MiniMax test 01.', () async {
    Board board = Board();
    board.doMove('0-0', 'O');
    board.doMove('1-0', 'O');
    board.doMove('2-1', 'O');

    board.doMove('2-0', 'X');
    board.doMove('0-1', 'X');
    board.doMove('2-2', 'X');

    MiniMax miniMax = MiniMax(board);
    String result = miniMax.result();
    expect('0-2', result, reason: 'Espera-se que AI jogue na posição 0-2');
  });

  test('MiniMax test 02.', () async {
    Board board = Board();
    board.doMove('0-0', 'O');
    board.doMove('2-0', 'O');
    board.doMove('2-2', 'O');

    board.doMove('1-0', 'X');
    board.doMove('1-2', 'X');

    MiniMax miniMax = MiniMax(board);
    String result = miniMax.result();
    expect('1-1', result, reason: 'Espera-se que AI jogue na posição 1-1');
  });

  test('MiniMax test 03.', () async {
    Board board = Board();
    board.doMove('0-0', 'O');
    board.doMove('2-0', 'O');
    board.doMove('1-1', 'O');
    board.doMove('2-1', 'O');

    board.doMove('1-0', 'X');
    board.doMove('0-1', 'X');
    board.doMove('0-2', 'X');

    MiniMax miniMax = MiniMax(board);
    String result = miniMax.result();
    expect('2-2', result, reason: 'Espera-se que AI jogue na posição 2-2');
  });

  test('MiniMax test 04.', () async {
    Board board = Board();
    board.doMove('1-0', 'O');
    board.doMove('1-1', 'O');
    board.doMove('2-2', 'O');

    board.doMove('0-0', 'X');
    board.doMove('2-0', 'X');
    board.doMove('0-2', 'X');

    MiniMax miniMax = MiniMax(board);
    String result = miniMax.result();
    expect('0-1', result, reason: 'Espera-se que AI jogue na posição 0-1');
  });
}
