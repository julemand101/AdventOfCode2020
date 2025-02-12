// --- Day 14: Docking Data ---
// https://adventofcode.com/2020/day/14

import 'dart:io';
import 'package:advent_of_code_2020/day14.dart';
import 'package:test/test.dart';

final input = File('test/data/day14.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveA(const [
          'mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X',
          'mem[8] = 11',
          'mem[7] = 101',
          'mem[8] = 0]',
        ]),
        equals(165),
      );
    });
    test('Solution', () {
      expect(solveA(input), equals(14722016054794));
    });
  });
  group('Part One', () {
    test('Example 1', () {
      expect(
        solveB(const [
          'mask = 000000000000000000000000000000X1001X',
          'mem[42] = 100',
          'mask = 00000000000000000000000000000000X0XX',
          'mem[26] = 1',
        ]),
        equals(208),
      );
    });
    test('Solution', () {
      expect(solveB(input), equals(3618217244644));
    });
  });
}
