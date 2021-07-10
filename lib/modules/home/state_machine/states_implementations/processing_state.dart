import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/modules/home/components/table_cell/table_cell_controller.dart';
import 'package:tictactoe/modules/home/home_controller.dart';
import 'package:tictactoe/modules/home/state_machine/state_machine.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/bot_state.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/game_over_state.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/player_state.dart';
import 'package:tictactoe/modules/home/tictactoe/board.dart';
import 'package:tictactoe/modules/home/tictactoe/game_result_state.dart';
import 'package:tictactoe/modules/home/tictactoe/round_result.dart';
import 'package:tictactoe/modules/home/utils/table_mapper.dart';

class ProcessingState extends StateMachine {
  Map<String, TableCellController> _cells;
  late TableMapper _tableMapper;
  bool _playerMove;

  ProcessingState(this._cells, this._playerMove) {
    _tableMapper = Modular.get();
  }

  @override
  Future enter() async {
    super.enter();
    Board board = _tableMapper.toBoard(_cells);
    RoundResult roundResult = board.result();
    await _processResult(roundResult);
  }

  Future _processResult(RoundResult result) async {
    HomeController homeController = Modular.get();
    GameResultState gameResultState = result.state;
    if (gameResultState == GameResultState.NO_FINISHED) {
      homeController.changeState(_playerMove ? BotState() : PlayerState());
    } else {
      homeController.changeState(GameOverState(result));
    }
  }
}
