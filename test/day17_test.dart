// --- Day 17: Conway Cubes ---
// https://adventofcode.com/2020/day/17

import 'package:advent_of_code_2020/day17.dart';
import 'package:test/test.dart';

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(solveA(const ['.#.', '..#', '###']), equals(112));
    });
    test('Solution', () {
      expect(
        solveA([
          '.#.#.#..',
          '..#....#',
          '#####..#',
          '#####..#',
          '#####..#',
          '###..#.#',
          '#..##.##',
          '#.#.####',
        ]),
        equals(375),
      );
    });
  });
  group('Part Two', () {
    test('Example 1', () {
      expect(solveB(const ['.#.', '..#', '###']), equals(848));
    });
    test('Solution', () {
      expect(
        solveB([
          '.#.#.#..',
          '..#....#',
          '#####..#',
          '#####..#',
          '#####..#',
          '###..#.#',
          '#..##.##',
          '#.#.####',
        ]),
        equals(2192),
      );
    });
  });
}
