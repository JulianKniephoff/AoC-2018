void main() {
  import std.stdio: stdin, writeln;
  import std.conv: to;
  import std.algorithm.iteration: map, sum;

  stdin
    .byLine
    .map!(to!int)
    .sum
    .writeln;
}
