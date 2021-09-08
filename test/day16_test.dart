// --- Day 16: Ticket Translation ---
// https://adventofcode.com/2020/day/16

import 'dart:io';
import 'package:advent_of_code_2020/day16.dart';
import 'package:test/test.dart';

final input = File('test/data/day16.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            'class: 1-3 or 5-7',
            'row: 6-11 or 33-44',
            'seat: 13-40 or 45-50',
            '',
            'your ticket:',
            '7,1,14',
            '',
            'nearby tickets:',
            '7,3,47',
            '40,4,50',
            '55,2,20',
            '38,6,12'
          ]),
          equals(71));
    });
    test('Solution', () {
      expect(solveA(input), equals(25984));
    });
  });
  group('Part Two', () {
    test('Solution', () {
      expect(solveB(input), equals(1265347500049));
    });
  });
}
