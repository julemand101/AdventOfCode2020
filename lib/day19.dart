// --- Day 19: Monster Messages ---
// https://adventofcode.com/2020/day/19

int solveA(List<String> input) => solve(input, partB: false);
int solveB(List<String> input) => solve(input, partB: true);

int solve(List<String> input, {required bool partB}) {
  final splitIndex = input.indexOf('');

  final ruleLines = input.sublist(0, splitIndex);
  final messages = input.sublist(splitIndex + 1);

  final numberRules = <int, List<List<int>>>{};
  late final int letterA;
  late final int letterB;

  for (final rule in ruleLines) {
    final split1 = rule.split(': ');
    final from = int.parse(split1.first);

    if (rule.contains('a')) {
      letterA = int.parse(split1.first);
    } else if (rule.contains('b')) {
      letterB = int.parse(split1.first);
    } else {
      final List<List<int>> to;

      if (split1[1].contains('|')) {
        to = split1[1]
            .split(' | ')
            .map((split) =>
                split.split(' ').map(int.parse).toList(growable: false))
            .toList(growable: false);
      } else {
        to = [split1[1].split(' ').map(int.parse).toList(growable: false)];
      }

      numberRules[from] = to;
    }
  }

  if (partB) {
    numberRules[8] = [
      [42],
      [42, 8]
    ];

    numberRules[11] = [
      [42, 31],
      [42, 11, 31]
    ];
  }

  return messages
      .map((msg) => [
            for (var i = 0; i < msg.length; i++)
              msg[i] == 'a' ? letterA : letterB
          ])
      .where((receivedMessage) => valid(receivedMessage, numberRules[0]!.first,
          numberRules, letterA, letterB))
      .length;
}

bool valid(List<int> receivedMessage, List<int> work,
    Map<int, List<List<int>>> numberRules, int letterA, int letterB) {
  if (equalLists(receivedMessage, work)) return true;

  final index = indexOfFirstDifference(receivedMessage, work);

  if (index == -1 || work[index] == letterA || work[index] == letterB) {
    return false;
  }

  for (final numberRule in numberRules[work[index]]!) {
    if (valid(
        receivedMessage,
        work.toList()..replaceRange(index, index + 1, numberRule),
        numberRules,
        letterA,
        letterB)) {
      return true;
    }
  }

  return false;
}

bool equalLists<T>(List<T> l1, List<T> l2) {
  if (l1.length != l2.length) return false;

  for (var i = 0; i < l1.length; i++) {
    if (l1[i] != l2[i]) return false;
  }

  return true;
}

int indexOfFirstDifference<T>(List<T> l1, List<T> l2) {
  final length = (l1.length > l2.length) ? l2.length : l1.length;

  for (var i = 0; i < length; i++) {
    if (l1[i] != l2[i]) return i;
  }

  return -1;
}
