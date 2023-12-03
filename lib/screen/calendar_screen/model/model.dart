class Event {
  String title;

  Event(this.title);
}

Map<DateTime, List<Event>> events = {
  DateTime.utc(2023,12,13) : [ Event('오메가 3'), Event('title2') ],
  DateTime.utc(2023,12,14) : [ Event('title3') ],
};

List<Event> getEventsForDay(DateTime day) {
  return events[day] ?? [];
}

