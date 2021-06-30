import 'package:tictactoe/modules/home/tictactoe/cell.dart';
import 'package:tictactoe/modules/home/tictactoe/game_result_state.dart';

class RoundResult {
  List<Cell> cells = [];
  GameResultState state = GameResultState.NO_FINISHED;

  void setResult(String char) {
    switch (char) {
      case 'X':
        state = GameResultState.X;
        break;
      case 'O':
        state = GameResultState.O;
        break;
      case 'TIED':
        state = GameResultState.TIED;
        break;
      default:
        state = GameResultState.NO_FINISHED;
    }
  }
}
