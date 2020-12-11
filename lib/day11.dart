// --- Day 11: Seating System ---
// https://adventofcode.com/2020/day/11

int solveA(Iterable<String> input) {
  final seatLayout = SeatLayout.parse(input);
  var anyUpdate = false;

  do {
    anyUpdate = false;
    final prevLayout = SeatLayout.copy(seatLayout);

    for (var y = 0; y < seatLayout.height; y++) {
      for (var x = 0; x < seatLayout.length; x++) {
        final prevState = prevLayout.get(x, y);

        if (prevState == SeatState.empty) {
          if (!prevLayout.neighbourStates(x, y).contains(SeatState.occupied)) {
            seatLayout.set(x, y, SeatState.occupied);
            anyUpdate = true;
          }
        } else if (prevState == SeatState.occupied) {
          if (prevLayout.neighbourStates(x, y).count(SeatState.occupied) >= 4) {
            seatLayout.set(x, y, SeatState.empty);
            anyUpdate = true;
          }
        }
      }
    }
  } while (anyUpdate);

  return seatLayout.seatsOccupied;
}

int solveB(Iterable<String> input) {
  final seatLayout = SeatLayout.parse(input);
  var anyUpdate = false;

  do {
    anyUpdate = false;
    final prevLayout = SeatLayout.copy(seatLayout);

    for (var y = 0; y < seatLayout.height; y++) {
      for (var x = 0; x < seatLayout.length; x++) {
        final prevState = prevLayout.get(x, y);

        if (prevState == SeatState.empty) {
          if (!prevLayout
              .firstSeatTheyCanSeeStates(x, y)
              .contains(SeatState.occupied)) {
            seatLayout.set(x, y, SeatState.occupied);
            anyUpdate = true;
          }
        } else if (prevState == SeatState.occupied) {
          if (prevLayout
                  .firstSeatTheyCanSeeStates(x, y)
                  .count(SeatState.occupied) >=
              5) {
            seatLayout.set(x, y, SeatState.empty);
            anyUpdate = true;
          }
        }
      }
    }
  } while (anyUpdate);

  return seatLayout.seatsOccupied;
}

enum SeatState { floor, empty, occupied }

class Grid<T> {
  final int length, height;
  final List<T> list;

  Grid.filled(this.length, this.height, T value)
      : list = List.filled(length * height, value, growable: false);
  Grid.copy(Grid<T> grid)
      : this.length = grid.length,
        this.height = grid.height,
        this.list = grid.list.toList(growable: false);

  T get(int x, int y) => list[_getPos(x, y)];
  void set(int x, int y, T value) => list[_getPos(x, y)] = value;

  int _getPos(int x, int y) => x + (y * length);
}

class SeatLayout extends Grid<SeatState> {
  SeatLayout.filled(int length, int height)
      : super.filled(length, height, SeatState.floor);

  SeatLayout.copy(SeatLayout seatLayout) : super.copy(seatLayout);

  factory SeatLayout.parse(Iterable<String> lines) {
    final List<List<SeatState>> seats = [];

    for (final line in lines) {
      final List<SeatState> row = [];

      for (var i = 0; i < line.length; i++) {
        switch (line[i]) {
          case '.':
            row.add(SeatState.floor);
            break;
          case 'L':
            row.add(SeatState.empty);
            break;
          case '#':
            row.add(SeatState.occupied);
            break;
          default:
            throw Exception('Could not parse: ${line[i]}');
        }
      }
      seats.add(row);
    }

    final seatLayout = SeatLayout.filled(seats.first.length, seats.length);

    for (var y = 0; y < seats.length; y++) {
      for (var x = 0; x < seats[y].length; x++) {
        seatLayout.set(x, y, seats[y][x]);
      }
    }

    return seatLayout;
  }

  Iterable<SeatState> neighbourStates(int x, int y) sync* {
    for (var _y = y - 1; _y <= y + 1; _y++) {
      for (var _x = x - 1; _x <= x + 1; _x++) {
        if (_x == x && _y == y) continue;
        yield get(_x, _y);
      }
    }
  }

  Iterable<SeatState> firstSeatTheyCanSeeStates(int x, int y) sync* {
    // left up
    var found = false;
    for (var _x = x - 1, _y = y - 1; _x >= 0 && _y >= 0; _x--, _y--) {
      final state = get(_x, _y);

      if (state != SeatState.floor) {
        found = true;
        yield state;
        break;
      }
    }
    if (!found) {
      yield SeatState.floor;
    }

    // up
    found = false;
    for (var _y = y - 1; _y >= 0; _y--) {
      final state = get(x, _y);

      if (state != SeatState.floor) {
        found = true;
        yield state;
        break;
      }
    }
    if (!found) {
      yield SeatState.floor;
    }

    // right up
    found = false;
    for (var _x = x + 1, _y = y - 1; _x < length && _y >= 0; _x++, _y--) {
      final state = get(_x, _y);

      if (state != SeatState.floor) {
        found = true;
        yield state;
        break;
      }
    }
    if (!found) {
      yield SeatState.floor;
    }

    // right
    found = false;
    for (var _x = x + 1; _x < length; _x++) {
      final state = get(_x, y);

      if (state != SeatState.floor) {
        found = true;
        yield state;
        break;
      }
    }
    if (!found) {
      yield SeatState.floor;
    }

    // right down
    found = false;
    for (var _x = x + 1, _y = y + 1; _x < length && _y < height; _x++, _y++) {
      final state = get(_x, _y);

      if (state != SeatState.floor) {
        found = true;
        yield state;
        break;
      }
    }
    if (!found) {
      yield SeatState.floor;
    }

    // down
    found = false;
    for (var _y = y + 1; _y < height; _y++) {
      final state = get(x, _y);

      if (state != SeatState.floor) {
        found = true;
        yield state;
        break;
      }
    }
    if (!found) {
      yield SeatState.floor;
    }

    // left down
    found = false;
    for (var _x = x - 1, _y = y + 1; _x >= 0 && _y < height; _x--, _y++) {
      final state = get(_x, _y);

      if (state != SeatState.floor) {
        found = true;
        yield state;
        break;
      }
    }
    if (!found) {
      yield SeatState.floor;
    }

    // left
    found = false;
    for (var _x = x - 1; _x >= 0; _x--) {
      final state = get(_x, y);

      if (state != SeatState.floor) {
        found = true;
        yield state;
        break;
      }
    }
    if (!found) {
      yield SeatState.floor;
    }
  }

  @override
  SeatState get(int x, int y) {
    if (y >= 0 && y < height) {
      if (x >= 0 && x < length) {
        return super.get(x, y);
      }
    }

    return SeatState.floor;
  }

  int get seatsOccupied =>
      list.where((seat) => seat == SeatState.occupied).length;

  @override
  String toString() {
    final sb = StringBuffer();

    for (var y = 0; y < height; y++) {
      for (var x = 0; x < length; x++) {
        switch (get(x, y)) {
          case SeatState.floor:
            sb.write('.');
            break;
          case SeatState.empty:
            sb.write('L');
            break;
          case SeatState.occupied:
            sb.write('#');
            break;
        }
      }
      sb.writeln();
    }

    return sb.toString();
  }
}

extension CountExtension<T> on Iterable<T> {
  int count(T element) => where((e) => e == element).length;
}
