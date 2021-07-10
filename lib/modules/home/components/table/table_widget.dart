import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tictactoe/modules/home/components/table/table_controller.dart';
import 'package:tictactoe/modules/home/components/table_cell/table_cell_widget.dart';

class TableWidget extends StatelessWidget {
  late Table _table;
  late TableController controller;
  double cellWidth;

  TableWidget(this.cellWidth) {
    controller = Modular.get();
    _initTable();
  }

  void _initTable() {
    List<TableRow> rows = [];
    for (int x = 0; x < 3; x++) {
      List<Widget> cells = [];
      for (int y = 0; y < 3; y++) {
        cells.add(TableCellWidget(cellWidth, x, y));
      }
      rows.add(TableRow(children: cells));
    }
    _table = Table(
      border: TableBorder.symmetric(inside: BorderSide(color: Colors.blueGrey[700]!, width: 5)),
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _table;
  }
}
