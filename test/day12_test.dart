// --- Day 12: Rain Risk ---
// https://adventofcode.com/2020/day/12

import 'dart:io';
import 'package:test/test.dart';
import 'package:advent_of_code_2020/day12.dart';

final input = File('test/data/day12.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['F10', 'N3', 'F7', 'R90', 'F11']), equals(25));
    });
    test('Solution', () {
      expect(solveA(input), equals(364));
    });
  });
}
