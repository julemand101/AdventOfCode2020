// --- Day 18: Operation Order ---
// https://adventofcode.com/2020/day/18

int solveA(Iterable<String> input) => input
    .map((e) => e.replaceAll(' ', ''))
    .map(calculate)
    .reduce((a, b) => a + b);

enum Mode { addition, multiplication }

int calculate(String input) {
  var sum = 0;
  var mode = Mode.addition;

  for (var i = 0; i < input.length; i++) {
    final char = input[i];

    if (char == '(') {
      final sb = StringBuffer(char);

      i++;
      for (var brackets = 1; brackets != 0 && i < input.length; i++) {
        final subChar = input[i];
        sb.write(subChar);

        if (subChar == '(') {
          brackets++;
        } else if (subChar == ')') {
          brackets--;
        }
      }
      i--;

      // remove first and last bracket before calculating
      final subSum = calculate(sb.toString().substring(1, sb.length - 1));
      sum = mode == Mode.addition ? sum + subSum : sum * subSum;
    } else if (char == '+') {
      mode = Mode.addition;
    } else if (char == '*') {
      mode = Mode.multiplication;
    } else {
      final number = int.parse(char);
      sum = mode == Mode.addition ? sum + number : sum * number;
    }
  }

  return sum;
}
