// --- Day 15: Rambunctious Recitation ---
// https://adventofcode.com/2020/day/15

import 'package:advent_of_code_2020/day15.dart';
import 'package:test/test.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const [0, 3, 6]), equals(436));
    });
    test('Example 2', () {
      expect(solveA(const [1, 3, 2]), equals(1));
    });
    test('Example 3', () {
      expect(solveA(const [2, 1, 3]), equals(10));
    });
    test('Example 4', () {
      expect(solveA(const [1, 2, 3]), equals(27));
    });
    test('Example 5', () {
      expect(solveA(const [2, 3, 1]), equals(78));
    });
    test('Example 6', () {
      expect(solveA(const [3, 2, 1]), equals(438));
    });
    test('Example 7', () {
      expect(solveA(const [3, 1, 2]), equals(1836));
    });
    test('Solution', () {
      expect(solveA(const [6, 19, 0, 5, 7, 13, 1]), equals(468));
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const [0, 3, 6]), equals(175594));
    });
    test('Example 2', () {
      expect(solveB(const [1, 3, 2]), equals(2578));
    });
    test('Example 3', () {
      expect(solveB(const [2, 1, 3]), equals(3544142));
    });
    test('Example 4', () {
      expect(solveB(const [1, 2, 3]), equals(261214));
    });
    test('Example 5', () {
      expect(solveB(const [2, 3, 1]), equals(6895259));
    });
    test('Example 6', () {
      expect(solveB(const [3, 2, 1]), equals(18));
    });
    test('Example 7', () {
      expect(solveB(const [3, 1, 2]), equals(362));
    });
    test('Solution', () {
      expect(solveB(const [6, 19, 0, 5, 7, 13, 1]), equals(1801753));
    });
  });
}
