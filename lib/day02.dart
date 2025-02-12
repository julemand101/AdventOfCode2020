// --- Day 2: Password Philosophy ---
// https://adventofcode.com/2020/day/2

int solveA(Iterable<String> input) =>
    input.where((final line) {
      final match = _regExp.firstMatch(line)!;
      final min = int.parse(match.namedGroup('min')!);
      final max = int.parse(match.namedGroup('max')!);
      final letterRune = match.namedGroup('letter')!.runes.first;
      final password = match.namedGroup('password')!;
      final numberOfTimesLetterOccurInPassword =
          password.runes.where((codeUnit) => codeUnit == letterRune).length;

      return numberOfTimesLetterOccurInPassword >= min &&
          numberOfTimesLetterOccurInPassword <= max;
    }).length;

int solveB(Iterable<String> input) =>
    input.where((final line) {
      final match = _regExp.firstMatch(line)!;
      final pos1 = int.parse(match.namedGroup('min')!) - 1; // 1 = first letter
      final pos2 = int.parse(match.namedGroup('max')!) - 1; //
      final letter = match.namedGroup('letter')!;
      final password = match.namedGroup('password')!;

      return (password[pos1] == letter && password[pos2] != letter) ||
          (password[pos1] != letter && password[pos2] == letter);
    }).length;

RegExp _regExp = RegExp(
  r'(?<min>\d+)-(?<max>\d+) (?<letter>[a-z]): (?<password>[a-z]+)',
);
