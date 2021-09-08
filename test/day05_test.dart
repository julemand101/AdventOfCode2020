// --- Day 5: Binary Boarding ---
// https://adventofcode.com/2020/day/5

import 'dart:io';
import 'package:advent_of_code_2020/day05.dart';
import 'package:test/test.dart';

final input = File('test/data/day05.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['FBFBBFFRLR']), equals(357));
    });
    test('Example 2', () {
      expect(solveA(const ['BFFFBBFRRR']), equals(567));
    });
    test('Example 3', () {
      expect(solveA(const ['FFFBBBFRRR']), equals(119));
    });
    test('Example 4', () {
      expect(solveA(const ['BBFFBBFRLL']), equals(820));
    });
    test('Solution', () {
      expect(solveA(input), equals(996));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(671));
    });
  });
}
