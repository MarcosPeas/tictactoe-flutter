import 'dart:isolate';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/modules/home/home_controller.dart';
import 'package:tictactoe/modules/home/isolates/minimax_isolate.dart';
import 'package:tictactoe/modules/home/minimax/mini_max.dart';
import 'package:tictactoe/modules/home/state_machine/state_machine.dart';
import 'package:tictactoe/modules/home/tictactoe/board.dart';
import 'package:tictactoe/modules/home/utils/table_mapper.dart';

class BotState extends StateMachine {
  late TableMapper _mapper;
  late HomeController _homeController;

  late Isolate _isolate;
  late SendPort _sendPort;

  late MiniMax _miniMax;
  late DateTime initialTime;

  BotState() {
    initialTime = DateTime.now();
    _mapper = Modular.get();
    _homeController = Modular.get();
  }

  @override
  Future enter() async {
    super.enter();
    _homeController.roundStatus.value = 'Wandrir está pensando...';
    Board board = _mapper.toBoard(_homeController.cellsController);
    _miniMax = MiniMax(board);
    _createIsolate(_miniMax);
  }

  Future _createIsolate(MiniMax miniMax) async {
    ReceivePort receivePort = ReceivePort();
    _sendPort = receivePort.sendPort;
    _isolate = await Isolate.spawn(runIsolate, MiniMaxIsolate(_sendPort, miniMax));
    receivePort.listen((message) {
      _onBotMove(message.toString());
    });
  }

  static void runIsolate(MiniMaxIsolate miniMaxIsolate) {
    miniMaxIsolate.run();
  }

  void _onBotMove(String movePosition) async {
    DateTime now = DateTime.now();
    int timeDiff = now.microsecondsSinceEpoch - initialTime.microsecondsSinceEpoch;
    if (timeDiff < 1000) {
      await Future.delayed(Duration(milliseconds: 1000));
    }
    _homeController.onBotMove(movePosition, 'X');
  }

  @override
  Future exit() {
    _isolate.removeOnExitListener(_sendPort);
    _isolate.kill(priority: Isolate.immediate);
    return super.exit();
  }
}
