struct Claim {
  import rect: Rect;

  Rect area;
  bool intact = true;

  this(Rect area) {
    this.area = area;
  }
}

void main() {
  import std.stdio: stdin, writeln;
  import std.algorithm.iteration: map;
  import rect: Rect, intersect;
  import std.array: array;
  import std.algorithm.searching: find;

  auto claims = stdin.byLine.map!Rect.map!Claim.array;
  foreach (i, ref claim1; claims) {
    //if (!claim1.intact) continue;
    foreach (ref claim2; claims[i + 1..$]) {
      //if (!claim2.intact) continue;

      if (intersect(claim1.area, claim2.area)) {
        claim1.intact = false;
        claim2.intact = false;
      }
    }
  }

  claims
    .find!(claim => claim.intact)[0]
    .area
    .id
    .writeln;
}
