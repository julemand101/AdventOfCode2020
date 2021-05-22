// --- Day 20: Jurassic Jigsaw ---
// https://adventofcode.com/2020/day/20

import 'dart:io';
import 'package:test/test.dart';
import 'package:advent_of_code_2020/day20.dart';

final input = File('test/data/day20.txt').readAsLinesSync();

void main() {
  group('Part One', () {
    test('Example 1', () {
      expect(
          solveA(const [
            'Tile 2311:',
            '..##.#..#.',
            '##..#.....',
            '#...##..#.',
            '####.#...#',
            '##.##.###.',
            '##...#.###',
            '.#.#.#..##',
            '..#....#..',
            '###...#.#.',
            '..###..###',
            '',
            'Tile 1951:',
            '#.##...##.',
            '#.####...#',
            '.....#..##',
            '#...######',
            '.##.#....#',
            '.###.#####',
            '###.##.##.',
            '.###....#.',
            '..#.#..#.#',
            '#...##.#..',
            '',
            'Tile 1171:',
            '####...##.',
            '#..##.#..#',
            '##.#..#.#.',
            '.###.####.',
            '..###.####',
            '.##....##.',
            '.#...####.',
            '#.##.####.',
            '####..#...',
            '.....##...',
            '',
            'Tile 1427:',
            '###.##.#..',
            '.#..#.##..',
            '.#.##.#..#',
            '#.#.#.##.#',
            '....#...##',
            '...##..##.',
            '...#.#####',
            '.#.####.#.',
            '..#..###.#',
            '..##.#..#.',
            '',
            'Tile 1489:',
            '##.#.#....',
            '..##...#..',
            '.##..##...',
            '..#...#...',
            '#####...#.',
            '#..#.#.#.#',
            '...#.#.#..',
            '##.#...##.',
            '..##.##.##',
            '###.##.#..',
            '',
            'Tile 2473:',
            '#....####.',
            '#..#.##...',
            '#.##..#...',
            '######.#.#',
            '.#...#.#.#',
            '.#########',
            '.###.#..#.',
            '########.#',
            '##...##.#.',
            '..###.#.#.',
            '',
            'Tile 2971:',
            '..#.#....#',
            '#...###...',
            '#.#.###...',
            '##.##..#..',
            '.#####..##',
            '.#..####.#',
            '#..#.#..#.',
            '..####.###',
            '..#.#.###.',
            '...#.#.#.#',
            '',
            'Tile 2729:',
            '...#.#.#.#',
            '####.#....',
            '..#.#.....',
            '....#..#.#',
            '.##..##.#.',
            '.#.####...',
            '####.#.#..',
            '##.####...',
            '##..#.##..',
            '#.##...##.',
            '',
            'Tile 3079:',
            '#.#.#####.',
            '.#..######',
            '..#.......',
            '######....',
            '####.#..#.',
            '.#...#.##.',
            '#.#####.##',
            '..#.###...',
            '..#.......',
            '..#.###...'
          ]),
          equals(20899048083289));
    });
    test('Solution', () {
      expect(solveA(input), equals(-1));
    });
  }, skip: true);
}