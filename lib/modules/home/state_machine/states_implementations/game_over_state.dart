import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/modules/home/home_controller.dart';
import 'package:tictactoe/modules/home/state_machine/state_machine.dart';
import 'package:tictactoe/modules/home/tictactoe/round_result.dart';

class GameOverState extends StateMachine {
  RoundResult _roundResult;

  GameOverState(this._roundResult);

  @override
  Future enter() async {
    super.enter();
    HomeController homeController = Modular.get();
    homeController.showRoundResult(_roundResult);
    return Future.value();
  }
}
