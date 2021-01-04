// --- Day 20: Jurassic Jigsaw ---
// https://adventofcode.com/2020/day/20

int solveA(Iterable<String> input) {
  parseInput(input).map((e) => Tile.parse(e)).forEach(print);
  return 0;
}

class Tile {
  final int tileId;
  final List<bool> top, left, right, bottom;

  const Tile(this.tileId, this.top, this.right, this.bottom, this.left);

  factory Tile.parse(List<String> input) {
    // Tile 2311:
    final tileId = int.parse(input.first.substring(5, 9));
    final top = _asBoolList(input[1]);
    final bottom = _asBoolList(input.last);
    final left = input
        .skip(1)
        .map((line) => line.codeUnits.first == 35)
        .toList(growable: false);
    final right = input
        .skip(1)
        .map((line) => line.codeUnits.last == 35)
        .toList(growable: false);

    return Tile(tileId, top, right, bottom, left);
  }

  void flipVertically() {}

  void flipHorizontally() {}

  void rotate90DegreesRight() {}

  // # = 35
  static List<bool> _asBoolList(String line) =>
      line.codeUnits.map((char) => char == 35).toList(growable: false);

  @override
  String toString() {
    final sb = StringBuffer('Tile ID: $tileId')..writeln();

    sb.writeln(toStringBoolList(top));

    for (var i = 1; i < left.length - 1; i++) {
      sb.writeln('${left[i] ? '#' : '.'}        ${right[i] ? '#' : '.'}');
    }

    sb.writeln(toStringBoolList(bottom));

    return sb.toString();
  }

  String toStringBoolList(List<bool> boolList) =>
      boolList.map((e) => e ? '#' : '.').join();
}

Iterable<List<String>> parseInput(Iterable<String> input) sync* {
  var buffer = <String>[];

  for (final line in input) {
    if (line.isEmpty) {
      yield buffer;
      buffer = [];
    } else {
      buffer.add(line);
    }
  }

  yield buffer;
}
