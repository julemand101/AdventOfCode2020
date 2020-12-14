// --- Day 14: Docking Data ---
// https://adventofcode.com/2020/day/14

final memoryValueRegExp = RegExp(r'mem\[(?<address>\d+)\] = (?<value>\d+)');

int solveA(Iterable<String> input) {
  final mask = List<bool?>.filled(36, null);
  final memory = <int, int>{}; // key = address, value = value

  for (final line in input) {
    if (line.startsWith('mask')) {
      final maskString = line.split('mask = ')[1];

      for (var i = 0; i < maskString.length; i++) {
        switch (maskString[i]) {
          case '0':
            mask[i] = false;
            break;
          case '1':
            mask[i] = true;
            break;
          case 'X':
            mask[i] = null;
            break;
          default:
            throw Exception('Could not parse: ${maskString[i]} in $line!');
        }
      }
    } else {
      final match = memoryValueRegExp.firstMatch(line)!;
      final address = int.parse(match.namedGroup('address')!);
      final value = int.parse(match.namedGroup('value')!)
          .toRadixString(2)
          .padLeft(36, '0');

      final buffer = StringBuffer();
      for (var i = 0; i < value.length; i++) {
        if (mask[i] == null) {
          buffer.writeCharCode(value.codeUnitAt(i));
        } else {
          buffer.write(mask[i]! ? '1' : '0');
        }
      }

      memory[address] = int.parse(buffer.toString(), radix: 2);
    }
  }

  return memory.values.reduce((a, b) => a + b);
}
