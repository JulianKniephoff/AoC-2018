module rect;

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
