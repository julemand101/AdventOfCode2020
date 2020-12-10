// --- Day 10: Adapter Array ---
// https://adventofcode.com/2020/day/10

import 'dart:io';
import 'package:test/test.dart';
import 'package:advent_of_code_2020/day10.dart';

final input = File('test/data/day10.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            '16',
            '10',
            '15',
            '5',
            '1',
            '11',
            '7',
            '19',
            '6',
            '12',
            '4'
          ]),
          equals(7 * 5));
    });
    test('Example 2', () {
      expect(
          solveA(const [
            '28',
            '33',
            '18',
            '42',
            '31',
            '14',
            '46',
            '20',
            '48',
            '47',
            '24',
            '23',
            '49',
            '45',
            '19',
            '38',
            '39',
            '11',
            '1',
            '32',
            '25',
            '35',
            '8',
            '17',
            '7',
            '9',
            '4',
            '2',
            '34',
            '10',
            '3'
          ]),
          equals(22 * 10));
    });
    test('Solution', () {
      expect(solveA(input), equals(1920));
    });
  });
}
