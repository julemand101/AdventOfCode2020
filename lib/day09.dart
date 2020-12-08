// --- Day 8: Handheld Halting ---
// https://adventofcode.com/2020/day/8

final instructionRegExp =
    RegExp(r'(?<operation>acc|jmp|nop) (?<argument>[+-]\d+)');

class Result {
  final bool programTerminated;
  final int accumulator;

  const Result(this.accumulator, this.programTerminated);
}

int solveA(List<String> input) => run(input).accumulator;

int solveB(List<String> input) {
  final program = input.toList(growable: false); // input are not modifiable

  for (var i = 0; i < program.length; i++) {
    final line = program[i];

    if (line.startsWith('jmp')) {
      program[i] = line.replaceFirst('jmp', 'nop');
    } else if (line.startsWith('nop')) {
      program[i] = line.replaceFirst('nop', 'jmp');
    } else {
      continue;
    }

    final result = run(program);

    if (result.programTerminated) {
      return result.accumulator;
    } else {
      program[i] = line;
    }
  }

  throw Exception('Did not found any result!');
}

Result run(List<String> input) {
  var accumulator = 0;
  var lineOfExecution = 0;
  final visitedLines = <int>{};

  while (lineOfExecution >= 0 && lineOfExecution < input.length) {
    if (!visitedLines.add(lineOfExecution)) {
      return Result(accumulator, false);
    }

    final match = instructionRegExp.firstMatch(input[lineOfExecution])!;
    final operation = match.namedGroup('operation')!;
    final argument = int.parse(match.namedGroup('argument')!);

    if (operation == 'acc') {
      accumulator += argument;
      lineOfExecution++;
    } else if (operation == 'jmp') {
      lineOfExecution += argument;
    } else if (operation == 'nop') {
      lineOfExecution++;
    } else {
      throw Exception('Could not parse: ${input[lineOfExecution]}');
    }
  }

  return Result(accumulator, true);
}
