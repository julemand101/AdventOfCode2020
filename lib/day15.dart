// --- Day 15: Rambunctious Recitation ---
// https://adventofcode.com/2020/day/15

int solveA(List<int> input) => solve(input, 2020);
int solveB(List<int> input) => solve(input, 30000000);

int solve(List<int> input, int nthNumber) {
  var n = 0;
  var lastValue = 0;
  final lastVisitedMap = <int, int>{};

  for (var i = 0; i < input.length - 1; i++) {
    final number = input[i];

    lastVisitedMap[number] = ++n;
    lastValue = number;
  }

  lastValue = input.last;

  while (++n < nthNumber) {
    final visitedBefore = lastVisitedMap[lastValue];

    if (visitedBefore != null) {
      lastVisitedMap[lastValue] = n;
      lastValue = n - visitedBefore;
    } else {
      lastVisitedMap[lastValue] = n;
      lastValue = 0;
    }
  }

  return lastValue;
}
