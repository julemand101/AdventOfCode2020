// --- Day 12: Rain Risk ---
// https://adventofcode.com/2020/day/12

import 'dart:math';

int solveA(Iterable<String> input) {
  var position = const Point(0, 0);
  var facing = 0;

  const directionMap = {
    'N': Point(0, -1),
    'S': Point(0, 1),
    'E': Point(1, 0),
    'W': Point(-1, 0)
  };

  const facingMap = {
    0: 'E',
    90: 'S',
    180: 'W',
    270: 'N',
  };

  for (final line in input) {
    final action = line[0];
    final value = int.parse(line.substring(1));

    if (directionMap.containsKey(action)) {
      position += directionMap[action]! * value;
    } else if (action == 'L') {
      facing -= value;
    } else if (action == 'R') {
      facing += value;
    } else if (action == 'F') {
      position += directionMap[facingMap[facing % 360]!]! * value;
    } else {
      throw Exception('Could not understand: $line');
    }
  }

  return position.x.abs() + position.y.abs();
}
