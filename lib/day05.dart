// --- Day 5: Binary Boarding ---
// https://adventofcode.com/2020/day/5

import 'dart:math';

int solveA(Iterable<String> input) => input.map(getSeatId).reduce(max);

int solveB(Iterable<String> input) {
  final setIds = input.map(getSeatId).toSet();
  final minSeat = setIds.reduce(min), maxSeat = setIds.reduce(max);

  for (var seatId = minSeat; seatId <= maxSeat; seatId++) {
    if (!setIds.contains(seatId)) {
      return seatId;
    }
  }

  throw Exception('Did not found any empty seat!');
}

int getSeatId(String seat) =>
    divideAndConquer(seat.substring(0, 7), 127, 'F', 'B') * 8 +
    divideAndConquer(seat.substring(7), 7, 'L', 'R');

int divideAndConquer(String input, int max, String left, String right) {
  var low = 0, high = max;

  for (var i = 0; i < input.length; i++) {
    final center = ((high - low) ~/ 2) + low;

    if (input[i] == left) {
      high = center;
    } else if (input[i] == right) {
      low = center + 1;
    } else {
      throw Exception('${input[i]} is either $left or $right!');
    }
  }

  if (low != high) {
    throw Exception('low and high not equal! high: $high low: $low');
  }

  return low;
}
