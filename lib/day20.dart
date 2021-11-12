// --- Day 20: Jurassic Jigsaw ---
// https://adventofcode.com/2020/day/20

int solveA(Iterable<String> input) {
  final tiles = [
    for (final splitInput in parseInput(input)) Tile.parse(splitInput)
  ];

  final countMap = <int, int>{};

  for (final tileA in tiles) {
    for (final tileB in tiles) {
      if (tileA.tileId != tileB.tileId &&
          tileA.sides.any(tileB.sides.contains)) {
        countMap.update(tileA.tileId, (v) => v + 1, ifAbsent: () => 1);
      }
    }
  }

  return countMap.entries
      .where((entry) => entry.value == 2)
      .fold(1, (result, entry) => result * entry.key);
}

class Tile {
  final int tileId;
  final Set<int> sides;

  const Tile(
    this.tileId, {
    required this.sides,
  });

  factory Tile.parse(List<String> input) {
    // Tile 2311:
    final tileId = int.parse(input.first.substring(5, 9));
    final top = _asBoolList(input[1]);
    final bottom = _asBoolList(input.last);
    final left = [...input.skip(1).map((line) => line.codeUnits.first == 35)];
    final right = [...input.skip(1).map((line) => line.codeUnits.last == 35)];

    return Tile(
      tileId,
      sides: {
        _asInt(top),
        _asInt(top.reversed),
        _asInt(bottom),
        _asInt(bottom.reversed),
        _asInt(left),
        _asInt(left.reversed),
        _asInt(right),
        _asInt(right.reversed),
      },
    );
  }

  // # = 35
  static List<bool> _asBoolList(String line) =>
      line.codeUnits.map((char) => char == 35).toList(growable: false);

  static int _asInt(Iterable<bool> booleans) {
    var val = 0;

    for (final boolean in booleans) {
      val ^= boolean ? 1 : 0;
      val <<= 1;
    }

    return val >> 1;
  }
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
