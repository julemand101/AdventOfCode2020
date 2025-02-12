// --- Day 20: Jurassic Jigsaw ---
// https://adventofcode.com/2020/day/20

int solveA(Iterable<String> input) {
  final tiles = [
    for (final splitInput in parseInput(input)) Tile.parse(splitInput),
  ];

  for (final tileA in tiles) {
    for (final tileB in tiles) {
      if (tileA.tileId != tileB.tileId &&
          tileA.sides.any(tileB.sides.contains)) {
        tileA.neighbours.add(tileB);
      }
    }
  }

  return tiles
      .where((tile) => tile.neighbours.length == 2) // Corner tiles
      .fold(1, (result, tile) => result * tile.tileId);
}

class Tile {
  // # = 35
  static const hashTagChar = 35;

  final int tileId;
  final Set<int> sides;
  final Set<Tile> neighbours = {};

  Tile(this.tileId, {required this.sides});

  factory Tile.parse(List<String> input) {
    // Tile 2311:
    final tileId = int.parse(input.first.substring(5, 9));
    final top = _asBoolList(input[1]);
    final bottom = _asBoolList(input.last);
    final left = input
        .skip(1)
        .map((line) => line.codeUnits.first == hashTagChar)
        .toList(growable: false);
    final right = input
        .skip(1)
        .map((line) => line.codeUnits.last == hashTagChar)
        .toList(growable: false);

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

  static List<bool> _asBoolList(String line) =>
      line.codeUnits.map((char) => char == hashTagChar).toList(growable: false);

  // A side can be represented as a number by using the pixel values as bits
  // This optimization makes it a lot faster to compare sides between two tiles.
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
