import 'dart:math';

import 'package:tictactoe/modules/home/tictactoe/board.dart';
import 'package:tictactoe/modules/home/tictactoe/game_result_state.dart';
import 'package:tictactoe/modules/home/tictactoe/round_result.dart';

class MiniMax {
  List<MiniMax> _children = [];
  late Board _board;
  bool _botTurn = true;
  int _points = 0;
  String _currentPost = '';

  MiniMax(Board board) {
    _board = board.clone();
  }

  MiniMax._of(Board board, bool botTurn) {
    _board = board.clone();
    _botTurn = botTurn;
  }

  String result() {
    _children = [];
    List<String> moves = _board.allMoves();
    moves.forEach((pos) {
      Board board = _board.clone();
      board.doMove(pos, 'X');
      MiniMax miniMax = MiniMax._of(
        board,
        true,
      );
      miniMax._currentPost = pos;
      _children.add(miniMax);
      miniMax._result();
    });
    return _topMove();
  }

  void _result() {
    GameResultState result = _botTurn ? GameResultState.X : GameResultState.O;
    GameResultState otherResult = _botTurn ? GameResultState.O : GameResultState.X;
    int plusMinus = _botTurn ? 1 : -1;
    RoundResult roundResult = _board.result();
    if (roundResult.state == result) {
      _points = plusMinus;
      return;
    } else if (roundResult.state == otherResult) {
      _points = -plusMinus;
      return;
    } else if (roundResult.state == GameResultState.TIED) {
      _points = 0;
      return;
    }
    _executeMoves();
  }

  void _executeMoves() {
    List<String> moves = _board.allMoves();
    moves.forEach((pos) {
      Board board = _board.clone();
      board.doMove(pos, _botTurn ? 'O' : 'X');
      MiniMax miniMax = MiniMax._of(board, !_botTurn);

      miniMax._currentPost = pos;
      _children.add(miniMax);
      miniMax._result();
    });
    _points = _miniMax();
  }

  int _miniMax() {
    return !_botTurn ? _max() : _mini();
  }

  int _mini() {
    int mini = double.maxFinite.round();
    _children.forEach((element) {
      mini = element._points < mini ? element._points : mini;
    });
    return mini;
  }

  int _max() {
    int max = -double.maxFinite.round();
    _children.forEach((element) {
      max = element._points > max ? element._points : max;
    });
    return max;
  }

  String _topMove() {
    List<String> pos = [];
    int maxValue = _maxValue();
    _children.forEach((child) {
      int points = child._points;
      if (points == maxValue) {
        pos.add(child._currentPost);
      }
      print('${child._currentPost}: $points');
    });
    return _selectRandomPos(pos);
  }

  String _selectRandomPos(List<String> poses) {
    int count = poses.length;
    int pos = Random().nextInt(count);
    return poses[pos];
  }

  int _maxValue() {
    int max = -double.maxFinite.round();
    _children.forEach((child) {
      if (child._points > max) {
        max = child._points;
      }
    });
    return max;
  }
}
