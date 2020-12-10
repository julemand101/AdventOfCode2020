// --- Day 10: Adapter Array ---
// https://adventofcode.com/2020/day/10

int solveA(Iterable<String> input) {
  final list = [0, ...input.map(int.parse)]..sort();
  var oneJolt = 0, threeJolt = 1;

  for (var i = 1; i < list.length; i++) {
    final diff = list[i] - list[i - 1];

    if (diff == 1) {
      oneJolt++;
    } else if (diff == 3) {
      threeJolt++;
    }
  }

  return oneJolt * threeJolt;
}
