// --- Day 14: Docking Data ---
// https://adventofcode.com/2020/day/14

final memoryValueRegExp = RegExp(r'mem\[(?<address>\d+)\] = (?<value>\d+)');

int solveA(Iterable<String> input) {
  final mask = List<bool?>.filled(36, null, growable: false);
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

int solveB(Iterable<String> input) {
  final mask = List<bool?>.filled(36, null, growable: false);
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
      final addressBinaryString = int.parse(match.namedGroup('address')!)
          .toRadixString(2)
          .padLeft(36, '0');

      final value = int.parse(match.namedGroup('value')!);
      final address = List<bool?>.generate(addressBinaryString.length, (i) {
        if (mask[i] == false) {
          return addressBinaryString[i] == '1';
        } else if (mask[i] == true) {
          return true;
        } else {
          // ignore: avoid_returning_null
          return null;
        }
      }, growable: false);

      setMemory(address, memory, value);
    }
  }

  return memory.values.reduce((a, b) => a + b);
}

void setMemory(List<bool?> address, Map<int, int> memory, int value,
    {int pos = 0}) {
  var foundX = false;

  for (var i = pos; i < address.length; i++) {
    if (address[i] == null) {
      foundX = true;
      setMemory(address..[i] = false, memory, value, pos: i + 1);
      setMemory(address..[i] = true, memory, value, pos: i + 1);
      address[i] = null;
      return;
    }
  }

  // Address does not contain any x (null)
  if (!foundX) {
    memory[int.parse(address.map((bit) => bit! ? '1' : '0').join(), radix: 2)] =
        value;
  }
}
