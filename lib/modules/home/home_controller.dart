import 'package:rx_notifier/rx_notifier.dart';
import 'package:tictactoe/modules/home/state_machine/state_machine.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/begin_state.dart';

class HomeController {
  var _stateMachine = RxNotifier<StateMachine>(BeginState());
  bool _busy = false;

  void changeState(StateMachine stateMachine) async {
    if (_busy) return;
    _busy = true;
    await _stateMachine.value.exit();
    _stateMachine.value = stateMachine;
    await _stateMachine.value.enter();
    _busy = false;
  }
}
