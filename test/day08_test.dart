// --- Day 8: Handheld Halting ---
// https://adventofcode.com/2020/day/8

import 'dart:io';
import 'package:advent_of_code_2020/day08.dart';
import 'package:test/test.dart';

final input = File('test/data/day08.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            'nop +0',
            'acc +1',
            'jmp +4',
            'acc +3',
            'jmp -3',
            'acc -99',
            'acc +1',
            'jmp -4',
            'acc +6'
          ]),
          equals(5));
    });
    test('Solution', () {
      expect(solveA(input), equals(1317));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(
          solveB(const [
            'nop +0',
            'acc +1',
            'jmp +4',
            'acc +3',
            'jmp -3',
            'acc -99',
            'acc +1',
            'jmp -4',
            'acc +6'
          ]),
          equals(8));
    });
    test('Solution', () {
      expect(solveB(input), equals(1033));
    });
  });
}
