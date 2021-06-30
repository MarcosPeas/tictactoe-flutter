import 'package:tictactoe/modules/home/tictactoe/cell.dart';
import 'package:tictactoe/modules/home/tictactoe/round_result.dart';

class Board {
  Map<String, Cell> _cells = Map();

  Board() {
    for (int x = 0; x < 3; x++) {
      for (int y = 0; y < 3; y++) {
        _cells['$x-$y'] = Cell(x: x, y: y);
      }
    }
  }

  void doMove(String key, String char) {
    Cell? cell = _cells[key];
    if (cell == null) return;
    cell.char = char;
  }

  RoundResult result() {
    RoundResult roundResult = RoundResult();

    List<Cell> findVertical = _findVertical();
    List<Cell> findHorizontal = _findHorizontal();
    List<Cell> findDiagonals = _findDiagonals();

    roundResult.cells.addAll(findVertical);
    roundResult.cells.addAll(findHorizontal);
    roundResult.cells.addAll(findDiagonals);

    if (roundResult.cells.isEmpty && !hasMove()) {
      roundResult.setResult('TIED');
    } else if (roundResult.cells.isNotEmpty) {
      roundResult.setResult(roundResult.cells[0].char);
    }
    return roundResult;
  }

  List<Cell> _findVertical() {
    List<Cell> result = [];
    for (int i = 0; i < 3; i++) {
      String key0 = '$i-0';
      String key1 = '$i-1';
      String key2 = '$i-2';
      if (_hasMatch(key0, key1, key2)) {
        result.add(_cells[key0]!);
        result.add(_cells[key1]!);
        result.add(_cells[key2]!);
      }
    }
    return result;
  }

  List<Cell> _findHorizontal() {
    List<Cell> result = [];
    for (int i = 0; i < 3; i++) {
      String key0 = '0-$i';
      String key1 = '1-$i';
      String key2 = '2-$i';
      if (_hasMatch(key0, key1, key2)) {
        result.add(_cells[key0]!);
        result.add(_cells[key1]!);
        result.add(_cells[key2]!);
      }
    }
    return result;
  }

  List<Cell> _findDiagonals() {
    List<Cell> result = [];
    String key0 = '0-0';
    String key1 = '1-1';
    String key2 = '2-2';
    String key4 = '0-2';
    String key5 = '2-0';
    if (_hasMatch(key0, key1, key2)) {
      result.add(_cells[key0]!);
      result.add(_cells[key1]!);
      result.add(_cells[key2]!);
    }
    if (_hasMatch(key4, key1, key5)) {
      result.add(_cells[key4]!);
      result.add(_cells[key1]!);
      result.add(_cells[key5]!);
    }
    return result;
  }

  bool _hasMatch(String key0, String key1, String key2) {
    var cell0 = _cells[key0];
    var cell1 = _cells[key1];
    var cell2 = _cells[key2];
    if (cell0 == null || cell1 == null || cell2 == null) return false;
    if (cell0.char.isEmpty) return false;
    return cell0.char == cell1.char && cell1.char == cell2.char;
  }

  bool hasMove() {
    List<Cell> values = _cells.values.toList();
    for (int i = 0; i < values.length; i++) {
      if (values[i].char.isEmpty) {
        return true;
      }
    }
    return false;
  }
}
