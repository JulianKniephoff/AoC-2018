void main() {
  import std.stdio: stdin, write, writeln;
  import std.array: array;
  import std.range: lockstep;

  auto ids = stdin.byLineCopy.array;
  foreach (i, id1; ids) {
  different: foreach (id2; ids[(i + 1)..$]) {
      bool different = false;
      size_t difference = 0;
      foreach (j, a, b; lockstep(id1, id2)) {
        if (a != b) {
          if (different) {
            continue different;
          } else {
            different = true;
            difference = j;
          }
        }
      }
      // not too different
      foreach (j, c; id1) {
        if (j == difference) continue;
        write(c);
      }
      writeln();
    }
  }
}
