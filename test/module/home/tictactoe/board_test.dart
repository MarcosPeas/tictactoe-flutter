import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/modules/home/tictactoe/board.dart';
import 'package:tictactoe/modules/home/tictactoe/game_result_state.dart';
import 'package:tictactoe/modules/home/tictactoe/round_result.dart';

void main() {
  test('No finished result', () {
    Board board = Board();
    board.doMove('0-0', 'O');
    board.doMove('0-1', 'O');
    board.doMove('0-2', 'X');

    board.doMove('1-0', 'X');
    board.doMove('1-1', 'X');
    board.doMove('1-2', 'O');

    board.doMove('2-0', 'O');
    board.doMove('2-1', 'O');

    RoundResult roundResult = board.result();

    expect(GameResultState.NO_FINISHED, roundResult.state,
        reason: 'O valor do resultado deve ser NO_FINISHED');
  });

  test('Winner vertical column 0 with X', () {
    Board board = Board();
    board.doMove('0-0', 'X');
    board.doMove('0-1', 'X');
    board.doMove('0-2', 'X');

    RoundResult roundResult = board.result();

    expect(GameResultState.X, roundResult.state,
        reason: 'O valor do resultado deve ser X');
  });

  test('Winner vertical column 1 with O', () {
    Board board = Board();
    board.doMove('1-0', 'O');
    board.doMove('1-1', 'O');
    board.doMove('1-2', 'O');

    RoundResult roundResult = board.result();

    expect(GameResultState.O, roundResult.state,
        reason: 'O valor do resultado deve ser O');
  });

  test('Winner vertical column 2 with O', () {
    Board board = Board();
    board.doMove('2-0', 'O');
    board.doMove('2-1', 'O');
    board.doMove('2-2', 'O');

    RoundResult roundResult = board.result();

    expect(GameResultState.O, roundResult.state,
        reason: 'O valor do resultado deve ser O');
  });

  test('Winner horizontal line 0 with X', () {
    Board board = Board();
    board.doMove('0-0', 'X');
    board.doMove('1-0', 'X');
    board.doMove('2-0', 'X');

    RoundResult roundResult = board.result();

    expect(GameResultState.X, roundResult.state,
        reason: 'O valor do resultado deve ser X');
  });

  test('Winner horizontal line 1 with X', () {
    Board board = Board();
    board.doMove('0-1', 'X');
    board.doMove('1-1', 'X');
    board.doMove('2-1', 'X');

    RoundResult roundResult = board.result();

    expect(GameResultState.X, roundResult.state,
        reason: 'O valor do resultado deve ser X');
  });

  test('Winner horizontal line 0 with O', () {
    Board board = Board();
    board.doMove('0-2', 'O');
    board.doMove('1-2', 'O');
    board.doMove('2-2', 'O');

    RoundResult roundResult = board.result();

    expect(GameResultState.O, roundResult.state,
        reason: 'O valor do resultado deve ser O');
  });

  test('Winner diagonal A with O', () {
    Board board = Board();
    board.doMove('0-0', 'O');
    board.doMove('1-1', 'O');
    board.doMove('2-2', 'O');

    RoundResult roundResult = board.result();

    expect(GameResultState.O, roundResult.state,
        reason: 'O valor do resultado deve ser O');
  });

  test('Winner diagonal B with X', () {
    Board board = Board();
    board.doMove('0-2', 'X');
    board.doMove('1-1', 'X');
    board.doMove('2-0', 'X');

    RoundResult roundResult = board.result();

    expect(GameResultState.X, roundResult.state,
        reason: 'O valor do resultado deve ser X');
  });

  test('Tied result', () {
    Board board = Board();
    board.doMove('0-0', 'O');
    board.doMove('0-1', 'O');
    board.doMove('0-2', 'X');

    board.doMove('1-0', 'X');
    board.doMove('1-1', 'X');
    board.doMove('1-2', 'O');

    board.doMove('2-0', 'O');
    board.doMove('2-1', 'O');
    board.doMove('2-2', 'X');

    RoundResult roundResult = board.result();

    expect(GameResultState.TIED, roundResult.state,
        reason: 'O valor do resultado deve ser X');
  });
}
