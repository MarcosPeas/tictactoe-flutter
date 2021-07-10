import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:tictactoe/modules/home/components/table/table_widget.dart';
import 'package:tictactoe/modules/home/home_controller.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/begin_state.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/bot_state.dart';
import 'package:tictactoe/modules/home/state_machine/states_implementations/game_over_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  TableWidget? tableWidget;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: RxBuilder(builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: SizedBox(
                          height: 2,
                          child: Visibility(
                              visible: controller.currentState.value is BotState, child: LinearProgressIndicator()),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _avatartWidgets()
                  ],
                ),
              ),
              AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        child: LayoutBuilder(
                          builder: (_, r) {
                            double width = r.maxWidth / 3;
                            if (tableWidget == null) {
                              tableWidget = TableWidget(width);
                            }
                            return tableWidget!;
                          },
                        ),
                      ),
                    ),
                  )),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${controller.roundStatus.value}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Visibility(
                      visible:
                          controller.currentState.value is GameOverState || controller.currentState.value is BeginState,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.reset();
                          },
                          child: Text(
                            controller.currentState.value is BeginState ? 'Iniciar' : 'Jogar novamente',
                          )),
                    ),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget _avatartWidgets() {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            Text(
              'VISITANTE',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              '${controller.winners.value}',
              style: TextStyle(color: Colors.pinkAccent, fontSize: 50),
            ),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Text(
              'EMPATES',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              '${controller.draws.value}',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Text(
              'WANDRIR',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              '${controller.lossers.value}',
              style: TextStyle(color: Colors.blue, fontSize: 50),
            ),
          ],
        )),
      ],
    );
  }
}
