struct Rect {
  size_t left;
  size_t top;
  size_t width;
  size_t height;

  this(char[] s) {
    import std.algorithm.searching: findSplit, findSplitAfter;
    import std.conv: parse;

    auto afterId = s.findSplitAfter("@ ")[1];
    auto attributes = afterId.findSplit(": ");
    auto position = attributes[0].findSplit(",");
    auto size = attributes[2].findSplit("x");

    left = parse!size_t(position[0]);
    top = parse!size_t(position[2]);
    width = parse!size_t(size[0]);
    height = parse!size_t(size[2]);
  }
}

void main() {
  import std.stdio: stdin, writeln;
  import std.algorithm.iteration: map;
  import std.conv: to;
  import std.algorithm.comparison: max;
  import std.format: format;

  size_t[1000][1000] fabric;
  size_t overlap;
  foreach(
    claim; stdin
      .byLine
      .map!(to!Rect)
  ) {
    foreach (x; claim.left..claim.left + claim.width) {
      foreach (y; claim.top..claim.top + claim.height) {
        auto count = ++fabric[x][y];
        if (count == 2) {
          ++overlap;
        }
      }
    }
  }
  writeln(overlap);
}
