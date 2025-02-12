// --- Day 9: Encoding Error ---
// https://adventofcode.com/2020/day/9

import 'dart:collection';
import 'dart:math';

int solveA(Iterable<String> input, {int preambleSize = 25}) =>
    findFirstWrongNumber(
      input.map(int.parse).toList(growable: false),
      preambleSize,
    );

int solveB(Iterable<String> input, {int preambleSize = 25}) {
  final list = input.map(int.parse).toList(growable: false);
  final firstWrongNumber = findFirstWrongNumber(list, preambleSize);
  final contiguousRange = Queue<int>();
  var sum = 0;

  for (final value in list) {
    sum += value;
    contiguousRange.add(value);

    while (sum > firstWrongNumber) {
      sum -= contiguousRange.removeFirst();
    }

    if (sum == firstWrongNumber) {
      return contiguousRange.reduce(min) + contiguousRange.reduce(max);
    }
  }

  throw Exception('Did not found the answer!');
}

int findFirstWrongNumber(List<int> list, int preambleSize) {
  for (var i = preambleSize; i < list.length - 1; i++) {
    if (!validNumber(list, i - preambleSize, i, list[i])) {
      return list[i];
    }
  }

  throw Exception('Could not find any wrong numbers!');
}

bool validNumber(List<int> list, int preStart, int preEnd, int number) {
  for (var i = preStart; i < preEnd; i++) {
    for (var j = i + 1; j < preEnd; j++) {
      if (list[i] + list[j] == number) {
        return true;
      }
    }
  }

  return false;
}
