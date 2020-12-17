// --- Day 16: Ticket Translation ---
// https://adventofcode.com/2020/day/16

int solveA(Iterable<String> input) =>
    Input.parse(input).getTicketScanningErrorRate();

int solveB(Iterable<String> input) {
  final parsedInput = Input.parse(input);
  final validRulesForEachColumn = [
    for (var i = 0; i < parsedInput.yourTicket.length; i++)
      parsedInput.ticketFieldRules
          .where((rule) => rule.validTicket(
              parsedInput.validNearbyTickets.map((ticket) => ticket[i])))
          .toList()
  ];

  while (validRulesForEachColumn.any((column) => column.length != 1)) {
    for (final columnRules in validRulesForEachColumn) {
      if (columnRules.length == 1) {
        validRulesForEachColumn
            .where((column) => column.length > 1)
            .forEach((element) => element.remove(columnRules.first));
      }
    }
  }

  var answer = 1;

  for (var i = 0; i < validRulesForEachColumn.length; i++) {
    if (validRulesForEachColumn[i].first.name.startsWith('departure')) {
      answer *= parsedInput.yourTicket[i];
    }
  }

  return answer;
}

class Input {
  final List<Rule> ticketFieldRules = [];
  final List<int> yourTicket = [];
  final List<List<int>> validNearbyTickets = [];
  final List<List<int>> invalidNearbyTickets = [];

  Input.parse(Iterable<String> input) {
    final iterator = input.iterator;

    // Parse rules for ticket fields
    while (iterator.moveNext() && iterator.current.isNotEmpty) {
      ticketFieldRules.add(Rule.parse(iterator.current));
    }

    // your ticket
    while (iterator.moveNext() && iterator.current != 'your ticket:') {}
    yourTicket.addAll(_parseTicket((iterator..moveNext()).current));

    // nearby tickets
    while (iterator.moveNext() && iterator.current != 'nearby tickets:') {}

    while (iterator.moveNext()) {
      final ticket = _parseTicket(iterator.current).toList(growable: false);

      if (validTicket(ticket)) {
        validNearbyTickets.add(ticket);
      } else {
        invalidNearbyTickets.add(ticket);
      }
    }
  }

  Iterable<int> _parseTicket(String line) => line.split(',').map(int.parse);

  bool validTicket(Iterable<int> ticket) =>
      ticketFieldRules.any((rule) => rule.validTicket(ticket));

  int getTicketScanningErrorRate() => invalidNearbyTickets.fold<int>(
      0,
      (sum, ticket) =>
          sum +
          ticket
              .where((ticketField) =>
                  ticketFieldRules.every((rule) => !rule.valid(ticketField)))
              .fold(0, (a, b) => a + b));
}

class Rule {
  final String name;
  final int interval1_min, interval1_max;
  final int interval2_min, interval2_max;

  const Rule(this.name, this.interval1_min, this.interval1_max,
      this.interval2_min, this.interval2_max);

  static final _pattern = RegExp(
      r'(?<name>.*): (?<min1>\d+)-(?<max1>\d+) or (?<min2>\d+)-(?<max2>\d+)');

  factory Rule.parse(String input) {
    final match = _pattern.firstMatch(input)!;

    return Rule(
        match.namedGroup('name')!,
        int.parse(match.namedGroup('min1')!),
        int.parse(match.namedGroup('max1')!),
        int.parse(match.namedGroup('min2')!),
        int.parse(match.namedGroup('max2')!));
  }

  bool valid(int number) =>
      (number >= interval1_min && number <= interval1_max) ||
      (number >= interval2_min && number <= interval2_max);

  bool validTicket(Iterable<int> ticket) => ticket.every(valid);

  @override
  String toString() =>
      "$name: $interval1_min-$interval1_max or $interval2_min-$interval2_max";
}
