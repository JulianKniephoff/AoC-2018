void main() {
  import std.stdio: stdin, writeln;
  import std.algorithm.iteration: map;
  import std.conv: to;
  import std.algorithm.comparison: max;
  import std.format: format;
  import rect: Rect;

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
