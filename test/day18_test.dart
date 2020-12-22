// --- Day 18: Operation Order ---
// https://adventofcode.com/2020/day/18

import 'dart:io';
import 'package:test/test.dart';
import 'package:advent_of_code_2020/day18.dart';

final input = File('test/data/day18.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['1 + 2 * 3 + 4 * 5 + 6']), equals(71));
    });
    test('Example 2', () {
      expect(solveA(const ['1 + (2 * 3) + (4 * (5 + 6))']), equals(51));
    });
    test('Example 3', () {
      expect(solveA(const ['2 * 3 + (4 * 5)']), equals(26));
    });
    test('Example 4', () {
      expect(solveA(const ['5 + (8 * 3 + 9 + 3 * 4 * 3)']), equals(437));
    });
    test('Example 5', () {
      expect(solveA(const ['5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))']),
          equals(12240));
    });
    test('Example 6', () {
      expect(solveA(const ['((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2']),
          equals(13632));
    });
    test('Solution', () {
      expect(solveA(input), equals(2743012121210));
    });
  });
}
