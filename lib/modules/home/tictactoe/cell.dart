class Cell {
  int? x;
  int? y;
  String char;

  Cell({this.x, this.y, this.char = ''});

  bool get empty => char.isEmpty;

  Cell clone() {
    return Cell(x: x, y: y, char: char);
  }
}
