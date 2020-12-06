// --- Day 6: Custom Customs ---
// https://adventofcode.com/2020/day/6

int solveA(Iterable<String> input) {
  var sum = 0;
  final bufferSet = <int>{};

  for (final line in input) {
    if (line.isEmpty) {
      sum += bufferSet.length;
      bufferSet.clear();
    } else {
      bufferSet.addAll(line.codeUnits);
    }
  }

  return sum + bufferSet.length;
}

int solveB(Iterable<String> input) {
  var sum = 0, groupSize = 0;
  final bufferMap = <int, int>{}; // key = codeUnit, value = count

  for (final line in input) {
    if (line.isEmpty) {
      sum += bufferMap.values.where((count) => count == groupSize).length;
      bufferMap.clear();
      groupSize = 0;
    } else {
      for (final codeUnit in line.codeUnits) {
        bufferMap.update(codeUnit, (count) => count + 1, ifAbsent: () => 1);
      }
      groupSize++;
    }
  }

  return sum + bufferMap.values.where((count) => count == groupSize).length;
}
