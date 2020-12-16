// --- Day 15: Rambunctious Recitation ---
// https://adventofcode.com/2020/day/15

import 'dart:typed_data';

int solveA(List<int> input) => solve(input, 2020);
int solveB(List<int> input) => solve(input, 30000000);

int solve(List<int> input, int nthNumber) {
  final lastVisitedMemory = Uint32List(nthNumber);
  var n = 0, lastValue = 0;

  for (var i = 0; i < input.length - 1; i++) {
    final number = input[i];

    lastVisitedMemory[number] = ++n;
    lastValue = number;
  }

  lastValue = input.last;

  while (++n < nthNumber) {
    final visitedBefore = lastVisitedMemory[lastValue];

    if (visitedBefore != 0) {
      lastVisitedMemory[lastValue] = n;
      lastValue = n - visitedBefore;
    } else {
      lastVisitedMemory[lastValue] = n;
      lastValue = 0;
    }
  }

  return lastValue;
}
