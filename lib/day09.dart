// --- Day 8: Handheld Halting ---
// https://adventofcode.com/2020/day/8

import 'dart:math';

int solveA(Iterable<String> input, {int preambleSize = 25}) =>
    findFirstWrongNumber(
        input.map(int.parse).toList(growable: false), preambleSize);

int solveB(Iterable<String> input, {int preambleSize = 25}) {
  final list = input.map(int.parse).toList(growable: false);
  final firstWrongNumber = findFirstWrongNumber(list, preambleSize);

  for (var i = 0; i < list.length; i++) {
    var sum = list[i], smallest = sum, biggest = sum;

    for (var j = i + 1; j < list.length; j++) {
      final number = list[j];

      smallest = min(smallest, number);
      biggest = max(biggest, number);
      sum += number;

      if (sum == firstWrongNumber) {
        return smallest + biggest;
      } else if (sum > firstWrongNumber) {
        break;
      }
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
