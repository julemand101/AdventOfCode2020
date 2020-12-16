// --- Day 16: Ticket Translation ---
// https://adventofcode.com/2020/day/16

class Interval {
  final int min, max;

  const Interval(this.min, this.max);

  bool partOf(int number) => number >= min && number <= max;
  bool notPartOf(int number) => !partOf(number);
}

int solveA(Iterable<String> input) {
  final pattern = RegExp(r'.*: (?<a1>\d+)-(?<a2>\d+) or (?<b1>\d+)-(?<b2>\d+)');
  final intervals = <Interval>[];
  var nearbyTicketsMode = false;
  var sum = 0;

  for (final line in input) {
    if (!nearbyTicketsMode) {
      final match = pattern.firstMatch(line);

      if (match != null) {
        intervals.add(Interval(int.parse(match.namedGroup('a1')!),
            int.parse(match.namedGroup('a2')!)));
        intervals.add(Interval(int.parse(match.namedGroup('b1')!),
            int.parse(match.namedGroup('b2')!)));
      } else if (line == 'nearby tickets:') {
        nearbyTicketsMode = true;
      }
    } else {
      sum += line
          .split(',')
          .map(int.parse)
          .where((number) =>
              intervals.every((interval) => interval.notPartOf(number)))
          .fold(0, (a, b) => a + b);
    }
  }

  return sum;
}
