// --- Day 3: Toboggan Trajectory ---
// https://adventofcode.com/2020/day/3

int solveA(List<String> input) => countTrees(input, right: 3, down: 1);

int solveB(List<String> input) =>
    countTrees(input, right: 1, down: 1) *
    countTrees(input, right: 3, down: 1) *
    countTrees(input, right: 5, down: 1) *
    countTrees(input, right: 7, down: 1) *
    countTrees(input, right: 1, down: 2);

int countTrees(List<String> map, {required int right, required int down}) {
  var trees = 0, x = right;

  for (var y = down; y < map.length; y += down) {
    if (map[y][x] == '#') {
      trees++;
    }
    x = (x + right) % map[y].length;
  }

  return trees;
}
