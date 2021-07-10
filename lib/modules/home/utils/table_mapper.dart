import 'package:tictactoe/modules/home/components/table_cell/table_cell_controller.dart';
import 'package:tictactoe/modules/home/tictactoe/board.dart';
import 'package:tictactoe/modules/home/tictactoe/cell.dart';

class TableMapper {
  Board toBoard(Map<String, TableCellController> cells) {
    Map<String, Cell> boardCells = Map();
    cells.forEach((key, value) {
      Cell cell = Cell(x: value.x, y: value.y, char: value.char.value);
      boardCells[key] = cell;
    });
    return Board.of(boardCells);
  }
}
