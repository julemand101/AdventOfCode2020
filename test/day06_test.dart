// --- Day 6: Custom Customs ---
// https://adventofcode.com/2020/day/6

import 'dart:io';
import 'package:advent_of_code_2020/day06.dart';
import 'package:test/test.dart';

final input = File('test/data/day06.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            'abc',
            '',
            'a',
            'b',
            'c',
            '',
            'ab',
            'ac',
            '',
            'a',
            'a',
            'a',
            'a',
            '',
            'b'
          ]),
          equals(11));
    });
    test('Solution', () {
      expect(solveA(input), equals(6416));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(const [
            'abc',
            '',
            'a',
            'b',
            'c',
            '',
            'ab',
            'ac',
            '',
            'a',
            'a',
            'a',
            'a',
            '',
            'b'
          ]),
          equals(6));
    });
    test('Solution', () {
      expect(solveB(input), equals(3050));
    });
  });
}
