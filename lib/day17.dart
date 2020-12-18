// --- Day 17: Conway Cubes ---
// https://adventofcode.com/2020/day/17

import 'package:equatable/equatable.dart';

int solveA(List<String> input) => solve(input, 3);
int solveB(List<String> input) => solve(input, 4);

int solve(List<String> input, int dimensions) {
  var activeCubes = <Point>{};

  for (var y = 0; y < input.length; y++) {
    for (var x = 0; x < input[y].length; x++) {
      if (input[y][x] == '#') {
        activeCubes.add(Point([x, y, for (var i = 2; i < dimensions; i++) 0]));
      }
    }
  }

  for (var i = 0; i < 6; i++) {
    final visitedNonActiveCubes = <Point, int>{};
    final newActiveCubes = <Point>{};

    for (final cube in activeCubes) {
      var numberOfActiveNeighbours = 0;

      for (final neighbour in cube.neighbours) {
        if (activeCubes.contains(neighbour)) {
          numberOfActiveNeighbours++;
        } else {
          visitedNonActiveCubes.update(neighbour, (count) => count + 1,
              ifAbsent: () => 1);
        }
      }

      if (numberOfActiveNeighbours == 2 || numberOfActiveNeighbours == 3) {
        newActiveCubes.add(cube);
      }
    }

    newActiveCubes.addAll(visitedNonActiveCubes.entries
        .where((e) => e.value == 3)
        .map((e) => e.key));

    activeCubes = newActiveCubes;
  }

  return activeCubes.length;
}

class Point extends Equatable {
  final List<int> dimensions;

  const Point(this.dimensions);

  Iterable<Point> get neighbours =>
      combinations(dimensions.toList(growable: false))
          .where((point) => point != this);

  Iterable<Point> combinations(List<int> input, [int i = 0]) sync* {
    if (i == input.length) {
      yield Point(input.toList(growable: false));
    } else {
      final value = input[i];
      yield* combinations(input..[i] = value - 1, i + 1);
      yield* combinations(input..[i] = value + 1, i + 1);
      yield* combinations(input..[i] = value, i + 1);
    }
  }

  @override
  List<Object?> get props => dimensions;

  @override
  bool? get stringify => true;
}
