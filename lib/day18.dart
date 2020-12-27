// --- Day 18: Operation Order ---
// https://adventofcode.com/2020/day/18

int solveA(Iterable<String> input) => input
    .map((e) => e.replaceAll(' ', ''))
    .map(calculateA)
    .reduce((a, b) => a + b);

int solveB(Iterable<String> input) => input
    .map((e) => e.replaceAll(' ', ''))
    .map(calculateB)
    .reduce((a, b) => a + b);

abstract class Token {
  const Token();
}

class Value extends Token {
  final int value;

  const Value(this.value);

  @override
  String toString() => 'Value($value)';

  Value operator +(Value other) => Value(value + other.value);
  Value operator *(Value other) => Value(value * other.value);
}

enum Mode { addition, multiplication }

class Operator extends Token {
  final Mode mode;

  const Operator(this.mode);

  @override
  String toString() => 'Operator($mode)';
}

int calculateA(String line) => calculate(line, partB: false);
int calculateB(String line) => calculate(line, partB: true);

int calculate(String line, {required bool partB}) {
  final tokens = <Token>[];

  for (var i = 0; i < line.length; i++) {
    final char = line[i];

    if (char == '(') {
      final sb = StringBuffer();

      i++;
      for (var brackets = 1; brackets != 0 && i < line.length; i++) {
        final subChar = line[i];

        if (subChar == '(') {
          brackets++;
        } else if (subChar == ')') {
          brackets--;
        }

        if (brackets != 0) {
          sb.write(subChar);
        }
      }
      i--;

      tokens.add(Value(calculate(sb.toString(), partB: partB)));
    } else if (char == '+') {
      tokens.add(const Operator(Mode.addition));
    } else if (char == '*') {
      tokens.add(const Operator(Mode.multiplication));
    } else {
      tokens.add(Value(int.parse(char)));
    }
  }

  while (tokens.length != 1) {
    int indexOperator;

    if (partB) {
      indexOperator = tokens.indexWhere(
          (token) => token is Operator && token.mode == Mode.addition);

      if (indexOperator == -1) {
        indexOperator = tokens.indexWhere(
            (token) => token is Operator && token.mode == Mode.multiplication);
      }
    } else {
      indexOperator = tokens.indexWhere((element) => element is Operator);
    }

    final aValue = tokens[indexOperator - 1] as Value;
    final bValue = tokens[indexOperator + 1] as Value;
    final operator = tokens[indexOperator] as Operator;

    if (operator.mode == Mode.addition) {
      tokens.replaceRange(
          indexOperator - 1, indexOperator + 2, [aValue + bValue]);
    } else {
      tokens.replaceRange(
          indexOperator - 1, indexOperator + 2, [aValue * bValue]);
    }
  }

  return tokens.cast<Value>().first.value;
}
