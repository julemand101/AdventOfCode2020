// --- Day 9: Encoding Error ---
// https://adventofcode.com/2020/day/9

import 'dart:io';
import 'package:test/test.dart';
import 'package:advent_of_code_2020/day09.dart';

final input = File('test/data/day09.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            '35',
            '20',
            '15',
            '25',
            '47',
            '40',
            '62',
            '55',
            '65',
            '95',
            '102',
            '117',
            '150',
            '182',
            '127',
            '219',
            '299',
            '277',
            '309',
            '576'
          ], preambleSize: 5),
          equals(127));
    });
    test('Solution', () {
      expect(solveA(input), equals(393911906));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(const [
            '35',
            '20',
            '15',
            '25',
            '47',
            '40',
            '62',
            '55',
            '65',
            '95',
            '102',
            '117',
            '150',
            '182',
            '127',
            '219',
            '299',
            '277',
            '309',
            '576'
          ], preambleSize: 5),
          equals(62));
    });
    test('Solution', () {
      expect(solveB(input), equals(59341885));
    });
  });
}
