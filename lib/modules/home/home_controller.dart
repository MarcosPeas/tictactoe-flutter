import 'package:rx_notifier/rx_notifier.dart';
import 'package:tictactoe/modules/home/components/table_cell/table_cell_controller.dart';
import 'package:tictactoe/modules/home/state_machine/state_machine.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/begin_state.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/bot_state.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/player_state.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/processing_state.dart';
import 'package:tictactoe/modules/home/tictactoe/cell.dart';
import 'package:tictactoe/modules/home/tictactoe/game_result_state.dart';
import 'package:tictactoe/modules/home/tictactoe/round_result.dart';

class HomeController {
  var currentState = RxNotifier<StateMachine>(BeginState());
  var roundStatus = RxNotifier<String>('Toque em iniciar.');
  var winners = RxNotifier<int>(0);
  var lossers = RxNotifier<int>(0);
  var draws = RxNotifier<int>(0);

  Map<String, TableCellController> cellsController = Map();

  void changeState(StateMachine stateMachine) async {
    currentState.value.exit();
    currentState.value = stateMachine;
    currentState.value.enter();
  }

  void addTableCellController(String key, TableCellController cellController) {
    cellsController[key] = cellController;
  }

  void onPlayerMove(String key, String char) {
    if (currentState.value is! PlayerState) return;
    cellsController[key]?.char.value = char;
    changeState(ProcessingState(cellsController, true));
  }

  void onBotMove(String key, String char) {
    if (currentState.value is! BotState) return;
    cellsController[key]?.char.value = char;
    changeState(ProcessingState(cellsController, false));
  }

  void reset() {
    roundStatus.value = '';
    cellsController.forEach((key, value) {
      value.char.value = '';
      value.highlight.value = false;
    });
    changeState(PlayerState());
  }

  void showRoundResult(RoundResult roundResult) {
    GameResultState gameResultState = roundResult.state;
    if (gameResultState == GameResultState.O) {
      this.roundStatus.value = 'Você venceu!';
      winners.value++;
      _showTilesForResult(roundResult.cells);
    } else if (gameResultState == GameResultState.X) {
      this.roundStatus.value = 'Wandrir venceu!';
      lossers.value++;
      _showTilesForResult(roundResult.cells);
    } else {
      draws.value++;
      this.roundStatus.value = 'Empate!';
    }
  }

  void _showTilesForResult(List<Cell> cells) {
    cells.forEach((cell) {
      cellsController['${cell.x}-${cell.y}']?.highlight.value = true;
    });
  }
}
