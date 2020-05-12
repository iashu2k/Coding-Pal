class CurrentTime {
  String getcurrent() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);

    String datetime = date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString() +
        'T' +
        date.hour.toString() +
        '%3A' +
        date.minute.toString() +
        '%3A' +
        date.second.toString();

    return datetime;
  }

  String getnextMonth() {
    DateTime now = DateTime.now().add(Duration(days: 30));
    DateTime date = DateTime(
        now.year, now.month, now.day, now.hour, now.minute, now.second);
    String datetime = date.year.toString() +
        '-' +
        date.month.toString() +
        '-' +
        date.day.toString() +
        'T' +
        date.hour.toString() +
        '%3A' +
        date.minute.toString() +
        '%3A' +
        date.second.toString();

    return datetime;
  }
}
