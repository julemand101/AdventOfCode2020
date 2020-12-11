// --- Day 11: Seating System ---
// https://adventofcode.com/2020/day/11

import 'dart:io';
import 'package:test/test.dart';
import 'package:advent_of_code_2020/day11.dart';

final input = File('test/data/day11.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1a', () {
      expect(
          solveA(const [
            'L.LL.LL.LL',
            'LLLLLLL.LL',
            'L.L.L..L..',
            'LLLL.LL.LL',
            'L.LL.LL.LL',
            'L.LLLLL.LL',
            '..L.L.....',
            'LLLLLLLLLL',
            'L.LLLLLL.L',
            'L.LLLLL.LL'
          ]),
          equals(37));
    });
    test('Example 1b', () {
      expect(
          solveA(const [
            '#.##.##.##',
            '#######.##',
            '#.#.#..#..',
            '####.##.##',
            '#.##.##.##',
            '#.#####.##',
            '..#.#.....',
            '##########',
            '#.######.#',
            '#.#####.##'
          ]),
          equals(37));
    });
    test('Example 1c', () {
      expect(
          solveA(const [
            '#.LL.L#.##',
            '#LLLLLL.L#',
            'L.L.L..L..',
            '#LLL.LL.L#',
            '#.LL.LL.LL',
            '#.LLLL#.##',
            '..L.L.....',
            '#LLLLLLLL#',
            '#.LLLLLL.L',
            '#.#LLLL.##'
          ]),
          equals(37));
    });
    test('Example 1d', () {
      expect(
          solveA(const [
            '#.##.L#.##',
            '#L###LL.L#',
            'L.#.#..#..',
            '#L##.##.L#',
            '#.##.LL.LL',
            '#.###L#.##',
            '..#.#.....',
            '#L######L#',
            '#.LL###L.L',
            '#.#L###.##'
          ]),
          equals(37));
    });
    test('Example 1e', () {
      expect(
          solveA(const [
            '#.#L.L#.##',
            '#LLL#LL.L#',
            'L.L.L..#..',
            '#LLL.##.L#',
            '#.LL.LL.LL',
            '#.LL#L#.##',
            '..L.L.....',
            '#L#LLLL#L#',
            '#.LLLLLL.L',
            '#.#L#L#.##'
          ]),
          equals(37));
    });
    test('Example 1f', () {
      expect(
          solveA(const [
            '#.#L.L#.##',
            '#LLL#LL.L#',
            'L.#.L..#..',
            '#L##.##.L#',
            '#.#L.LL.LL',
            '#.#L#L#.##',
            '..L.L.....',
            '#L#L##L#L#',
            '#.LLLLLL.L',
            '#.#L#L#.##'
          ]),
          equals(37));
    });
    test('Solution', () {
      expect(solveA(input), equals(2296));
    });
  });
}
