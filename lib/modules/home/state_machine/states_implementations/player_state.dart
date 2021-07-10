import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/modules/home/home_controller.dart';
import 'package:tictactoe/modules/home/state_machine/state_machine.dart';

class PlayerState extends StateMachine {
  @override
  Future enter() {
    super.enter();
    HomeController homeController = Modular.get();
    homeController.roundStatus.value = 'Sua vez.';
    return Future.value();
  }
}
