// --- Day 7: Handy Haversacks ---
// https://adventofcode.com/2020/day/7

import 'dart:collection';

final regExp = RegExp(r'([a-z ]+) bags contain (.*).');
final regExpNoOtherBags = RegExp(r'([a-z ]+) bags contain no other bags.');
final regExpSubBag = RegExp(r'([0-9]+) (.*) bag');

int solveA(Iterable<String> input) {
  final bagMap = <String, Set<String>>{};

  for (final line in input) {
    if (!regExpNoOtherBags.hasMatch(line)) {
      final match = regExp.firstMatch(line)!;
      final bag = match.group(1)!;
      final subBags = match.group(2)!.split(', ');

      for (final subBag in subBags) {
        final subMatch = regExpSubBag.firstMatch(subBag)!;
        final bagColor = subMatch.group(2)!;
        bagMap.update(bagColor, (set) => set..add(bag), ifAbsent: () => {bag});
      }
    }
  }

  final set = {...bagMap['shiny gold']!};
  final queue = Queue<String>.from(set);

  while (queue.isNotEmpty) {
    final color = queue.removeFirst();
    if (bagMap.containsKey(color)) {
      for (final bagColor in bagMap[color]!) {
        if (!set.contains(bagColor)) {
          queue.add(bagColor);
          set.add(bagColor);
        }
      }
    }
  }

  return set.length;
}

int solveB(Iterable<String> input) {
  final bagMap = <String, Map<String, int>>{};

  for (final line in input) {
    final noOtherBagsMatch = regExpNoOtherBags.firstMatch(line);

    if (noOtherBagsMatch != null) {
      bagMap[noOtherBagsMatch.group(1)!] = const {};
    } else {
      final match = regExp.firstMatch(line)!;
      final bagColor = match.group(1)!;
      final subBags = match.group(2)!.split(', ');

      for (final subBag in subBags) {
        final subBagMatch = regExpSubBag.firstMatch(subBag)!;
        final subBagCount = int.parse(subBagMatch.group(1)!);
        final subBagColor = subBagMatch.group(2)!;

        if (bagMap.containsKey(bagColor)) {
          final map = bagMap[bagColor]!;
          map.update(subBagColor, (count) => count + subBagCount,
              ifAbsent: () => subBagCount);
        } else {
          bagMap[bagColor] = {subBagColor: subBagCount};
        }
      }
    }
  }

  return calcBags(bagMap, {'shiny gold': 1}) - 1;
}

int calcBags(Map<String, Map<String, int>> bagMap, Map<String, int> wants) {
  var sum = 0;

  for (final wantsEntry in wants.entries) {
    final bagColor = wantsEntry.key;
    final bagCount = wantsEntry.value;
    final needs = Map.fromEntries(bagMap[bagColor]!
        .entries
        .map((e) => MapEntry(e.key, e.value * bagCount)));

    if (needs.isNotEmpty) {
      sum += calcBags(bagMap, needs);
    }
    sum += bagCount;
  }

  return sum;
}
