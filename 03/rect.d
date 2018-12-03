module rect;

struct Rect {
  string id;
  size_t left;
  size_t top;
  size_t width;
  size_t height;

  this(char[] s) {
    import std.algorithm.searching: findSplit, findSplitAfter;
    import std.conv: parse;

    auto parts = s.findSplit(" @ ");
    auto afterId = parts[2];
    auto attributes = afterId.findSplit(": ");
    auto position = attributes[0].findSplit(",");
    auto size = attributes[2].findSplit("x");

    id = parts[0].idup;
    left = parse!size_t(position[0]);
    top = parse!size_t(position[2]);
    width = parse!size_t(size[0]);
    height = parse!size_t(size[2]);
  }
}

bool intersect(Rect r1, Rect r2) {
  bool intervalsIntersect(size_t l1, size_t r1, size_t l2, size_t r2) {
    return l2 <= r1 && l1 <= r2;
  }
  return intervalsIntersect(
    r1.left, r1.left + r1.width,
    r2.left, r2.left + r2.width
  ) && intervalsIntersect(
    r1.top, r1.top + r1.height,
    r2.top, r2.top + r2.height
  );
}
