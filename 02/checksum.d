void main() {
  import std.stdio: stdin, lines, writeln;

  size_t[char] counts;
  size_t withDoubles = 0;
  size_t withTriples = 0;
  foreach (char[] line; stdin.lines) {
    counts.clear();
    foreach (char c; line) {
      ++counts.require(c, 0);
    }

    bool hasDoubles = false;
    bool hasTriples = false;
    foreach (size_t count; counts) {
      if (count == 2) {
        hasDoubles = true;
      } else if (count == 3) {
        hasTriples = true;
      }
    }
    withDoubles += hasDoubles;
    withTriples += hasTriples;
  }
  writeln(withDoubles * withTriples);
}
