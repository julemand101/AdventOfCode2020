// --- Day 8: Handheld Halting ---
// https://adventofcode.com/2020/day/8

enum Operation { acc, jmp, nop }

class Instruction {
  Operation operation;
  final int argument;

  Instruction(this.operation, this.argument);

  static final _instructionRegExp =
      RegExp(r'(?<operation>acc|jmp|nop) (?<argument>[+-]\d+)');

  factory Instruction.parse(String line) {
    final match = _instructionRegExp.firstMatch(line)!;
    final operation = match.namedGroup('operation')!;
    final argument = int.parse(match.namedGroup('argument')!);

    switch (operation) {
      case 'acc':
        return Instruction(Operation.acc, argument);
      case 'jmp':
        return Instruction(Operation.jmp, argument);
      case 'nop':
        return Instruction(Operation.nop, argument);
      default:
        throw Exception('Could not parse: $line');
    }
  }

  void switchJmpAndNop() {
    if (operation == Operation.nop) {
      operation = Operation.jmp;
    } else if (operation == Operation.jmp) {
      operation = Operation.nop;
    } else {
      throw Exception('Cannot switch: $operation');
    }
  }
}

class Result {
  final bool programTerminated;
  final int accumulator;

  const Result(this.accumulator, this.programTerminated);
}

int solveA(Iterable<String> input) =>
    run(input.map((line) => Instruction.parse(line)).toList(growable: false))
        .accumulator;

int solveB(Iterable<String> input) {
  final program =
      input.map((line) => Instruction.parse(line)).toList(growable: false);

  for (var i = 0; i < program.length; i++) {
    final instruction = program[i];

    if (instruction.operation == Operation.jmp ||
        instruction.operation == Operation.nop) {
      instruction.switchJmpAndNop();
    } else {
      continue;
    }

    final result = run(program);

    if (result.programTerminated) {
      return result.accumulator;
    } else {
      instruction.switchJmpAndNop();
    }
  }

  throw Exception('Did not found any result!');
}

Result run(List<Instruction> program) {
  var accumulator = 0;
  var lineOfExecution = 0;
  final visitedLines = <int>{};

  while (lineOfExecution >= 0 && lineOfExecution < program.length) {
    if (!visitedLines.add(lineOfExecution)) {
      return Result(accumulator, false);
    }

    final instruction = program[lineOfExecution];

    switch (instruction.operation) {
      case Operation.acc:
        accumulator += instruction.argument;
        lineOfExecution++;
        break;
      case Operation.jmp:
        lineOfExecution += instruction.argument;
        break;
      case Operation.nop:
        lineOfExecution++;
        break;
    }
  }

  return Result(accumulator, true);
}
