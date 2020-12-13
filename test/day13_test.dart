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
}
