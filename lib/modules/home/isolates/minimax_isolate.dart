import 'dart:isolate';

import 'package:tictactoe/modules/home/minimax/mini_max.dart';

class MiniMaxIsolate {
  SendPort _sendPort;
  MiniMax _miniMax;

  MiniMaxIsolate(this._sendPort, this._miniMax);

  void run() {
    String result = _miniMax.result();
    _sendPort.send(result);
  }
}
