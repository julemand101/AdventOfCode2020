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

int solveB(List<String> input) {
  final busses = input[1]
      .split(',')
      .map((bus) => int.tryParse(bus) ?? 0) // The value x is set to 0
      .toList(growable: false);

  return chineseRemainder(
    busses.where((busId) => busId > 0).toList(growable: false),
    busses
        .asMap()
        .entries
        .where((entry) => entry.value > 0)
        .map((entry) => (entry.value - entry.key) % entry.value)
        .toList(growable: false),
  );
}

// Converted from https://rosettacode.org/wiki/Chinese_remainder_theorem#Java
int chineseRemainder(List<int> n, List<int> a) {
  final prod = n.reduce((i, j) => i * j);

  var p = 0, sm = 0;
  for (int i = 0; i < n.length; i++) {
    p = prod ~/ n[i];
    sm += a[i] * mulInv(p, n[i]) * p;
  }
  return sm % prod;
}

int mulInv(int inputA, int inputB) {
  var a = inputA, b = inputB;
  final b0 = b;
  var x0 = 0;
  var x1 = 1;

  if (b == 1) return 1;

  while (a > 1) {
    final q = a ~/ b;
    final amb = a % b;
    a = b;
    b = amb;
    final xqx = x1 - q * x0;
    x1 = x0;
    x0 = xqx;
  }

  if (x1 < 0) x1 += b0;

  return x1;
}
