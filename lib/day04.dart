// --- Day 4: Passport Processing ---
// https://adventofcode.com/2020/day/4

int solveA(Iterable<String> input) => Passport.parseInput(
  input,
).where((passport) => passport.isValidPartOne).length;

int solveB(Iterable<String> input) => Passport.parseInput(
  input,
).where((passport) => passport.isValidPartTwo).length;

class Passport {
  int? byr, iyr, eyr;
  String? hgt, hcl, ecl, pid, cid;

  Passport(String line) {
    for (final field in line.split(' ')) {
      final parts = field.split(':');
      final key = parts[0];
      final value = parts[1];

      if (key == 'byr') byr = int.parse(value);
      if (key == 'iyr') iyr = int.parse(value);
      if (key == 'eyr') eyr = int.parse(value);
      if (key == 'hgt') hgt = value;
      if (key == 'hcl') hcl = value;
      if (key == 'ecl') ecl = value;
      if (key == 'pid') pid = value;
      if (key == 'cid') cid = value;
    }
  }

  static Iterable<Passport> parseInput(Iterable<String> input) sync* {
    final buffer = StringBuffer();

    for (final line in input.followedBy([''])) {
      if (line.isNotEmpty) {
        if (buffer.isNotEmpty) {
          buffer.write(' ');
        }
        buffer.write(line);
      } else {
        yield Passport(buffer.toString());
        buffer.clear();
      }
    }
  }

  bool get isValidPartOne =>
      byr != null &&
      iyr != null &&
      eyr != null &&
      hgt != null &&
      hcl != null &&
      ecl != null &&
      pid != null;

  bool get isValidPartTwo {
    if (!isValidPartOne) return false;

    if (byr! < 1920 || byr! > 2002) return false;
    if (iyr! < 2010 || iyr! > 2020) return false;
    if (eyr! < 2020 || eyr! > 2030) return false;

    if (hgt!.endsWith('cm')) {
      final heightInCm = int.parse(hgt!.substring(0, hgt!.length - 2));
      if (heightInCm < 150 || heightInCm > 193) return false;
    } else if (hgt!.endsWith('in')) {
      final heightInIn = int.parse(hgt!.substring(0, hgt!.length - 2));
      if (heightInIn < 59 || heightInIn > 76) return false;
    } else {
      return false;
    }

    if (!hcl!.contains(RegExp(r'#[0-9a-f]{6}'))) return false;
    if (!ecl!.contains(RegExp(r'amb|blu|brn|gry|grn|hzl|oth'))) return false;
    if (pid!.length != 9) return false;

    return true;
  }
}
