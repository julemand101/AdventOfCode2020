// --- Day 13: Shuttle Search ---
// https://adventofcode.com/2020/day/13

int solveA(List<String> input) {
  final earliestTimestamp = int.parse(input[0]);
  final busses = input[1]
      .split(',')
      .where((bus) => bus != 'x')
      .map(int.parse)
      .toList(growable: false);

  var bestBus = busses[0];
  var bestBusWaitingTime = busses[0];

  for (final bus in busses) {
    final waitingTime = bus - earliestTimestamp % bus;
    if (waitingTime < bestBusWaitingTime) {
      bestBus = bus;
      bestBusWaitingTime = waitingTime;
    }
  }

  return bestBus * bestBusWaitingTime;
}
