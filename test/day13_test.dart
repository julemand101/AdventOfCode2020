// --- Day 13: Shuttle Search ---
// https://adventofcode.com/2020/day/13

import 'dart:io';
import 'package:test/test.dart';
import 'package:advent_of_code_2020/day13.dart';

final input = File('test/data/day13.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['939', '7,13,x,x,59,x,31,19']), equals(295));
    });
    test('Solution', () {
      expect(solveA(input), equals(3997));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const ['IGNORE', '7,13,x,x,59,x,31,19']), equals(1068781));
    });
    test('Example 2', () {
      expect(solveB(const ['IGNORE', '17,x,13,19']), equals(3417));
    });
    test('Example 3', () {
      expect(solveB(const ['IGNORE', '67,7,59,61']), equals(754018));
    });
    test('Example 4', () {
      expect(solveB(const ['IGNORE', '67,x,7,59,61']), equals(779210));
    });
    test('Example 5', () {
      expect(solveB(const ['IGNORE', '67,7,x,59,61']), equals(1261476));
    });
    test('Example 6', () {
      expect(solveB(const ['IGNORE', '1789,37,47,1889']), equals(1202161486));
    });
    test('Solution', () {
      expect(solveB(input), equals(500033211739354));
    });
  });
}
