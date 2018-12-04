void main() {
  import std.stdio: stdin, writeln;
  import std.datetime: Date;
  import std.algorithm.searching: findSplit;
  import std.container: Array;
  import std.container.util: make;
  import std.conv: to;

  enum EventType { FallAsleep, WakeUp }
  struct Event {
    ubyte minute;
    EventType type;
  }

  Array!Event[Date] records;
  size_t[Date] schedule;

  foreach (record; stdin.byLine) {
    auto parts = record.findSplit("] ");
    auto dateTime = parts[0][1..$];
    auto dateTimeParts = dateTime.findSplit(" ");
    auto date = Date.fromISOExtString(dateTimeParts[0]);
    auto minute = to!ubyte(dateTimeParts[2].findSplit(":")[2]);

    auto eventParts = parts[2].findSplit(" ");
    auto todaysRecords = records.require(date, make!(Array!Event)());
    final switch (eventParts[0]) {
    case "Guard":
      auto guardId = to!size_t(eventParts[2].findSplit(" ")[0][1..$]);
      schedule[date] = guardId;
      break;
    case "wakes":
      todaysRecords.insertBack(Event(minute, EventType.WakeUp));
      break;
    case "falls":
      todaysRecords.insertBack(Event(minute, EventType.FallAsleep));
      break;
    }
  }
}
