// --- Day 1: Report Repair ---
// https://adventofcode.com/2020/day/1

int solveA(Iterable<String> input) {
  final list = input.map(int.parse).toList(growable: false);

  for (var a = 0; a < list.length; a++) {
    for (var b = 0; b < list.length; b++) {
      if (a == b) {
        continue;
      }

      if (list[a] + list[b] == 2020) {
        return list[a] * list[b];
      }
    }
  }

  throw Exception('No solution found!');
}

int solveB(Iterable<String> input) {
  final list = input.map(int.parse).toList(growable: false);

  for (var a = 0; a < list.length; a++) {
    for (var b = 0; b < list.length; b++) {
      if (a == b) {
        continue;
      }

      for (var c = 0; c < list.length; c++) {
        if (a == c || b == c) {
          continue;
        }

        if (list[a] + list[b] + list[c] == 2020) {
          return list[a] * list[b] * list[c];
        }
      }
    }
  }

  throw Exception('No solution found!');
}
