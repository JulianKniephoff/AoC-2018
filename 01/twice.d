void main() {
  import std.stdio: stdin, writeln;
  import std.conv: to;
  import std.range: array, cycle;
  import std.algorithm.iteration: map, cumulativeFold;

  struct Seen {}
  Seen[int] previousFrequencies;
  foreach (
    int frequency; stdin
      .byLine
      .map!(to!int)
      .array
      .cycle
      .cumulativeFold!((a, b) => a + b)(0)
  ) {
    if (frequency in previousFrequencies) {
      writeln(frequency);
      break;
    } else {
      previousFrequencies[frequency] = Seen();
    }
  }
}
