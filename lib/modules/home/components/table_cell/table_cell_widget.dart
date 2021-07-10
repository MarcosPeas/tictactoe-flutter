import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:tictactoe/modules/home/components/table_cell/table_cell_controller.dart';
import 'package:tictactoe/modules/home/home_controller.dart';

class TableCellWidget extends StatelessWidget {
  late TableCellController controller;
  double cellWidth;

  TableCellWidget(this.cellWidth, int x, int y) {
    controller = Modular.get();
    controller.x = x;
    controller.y = y;
    HomeController homeController = Modular.get();
    homeController.addTableCellController('$x-$y', controller);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.char.value.isEmpty) {
          HomeController homeController = Modular.get();
          homeController.onPlayerMove('${controller.x}-${controller.y}', 'O');
        }
      },
      child: SizedBox(
        width: cellWidth,
        height: cellWidth,
        child: RxBuilder(builder: (_) {
          return Container(color: _highlightBackgroundColor(), child: Center(child: _cellContent()));
        }),
      ),
    );
  }

  Widget _cellContent() {
    String char = controller.char.value;
    if (char.isEmpty) {
      return Container(
        color: Colors.transparent,
      );
    }
    return char == 'X' ? iconX() : iconO();
  }

  Color _highlightBackgroundColor() {
    return controller.highlight.value ? Colors.blueGrey[800]! : Colors.transparent;
  }

  Widget iconX() {
    return Icon(
      Icons.clear,
      color: Colors.blue,
      size: 88,
    );
  }

  Widget iconO() {
    return Icon(
      Icons.panorama_fish_eye,
      color: Colors.pinkAccent,
      size: 80,
    );
  }
}
