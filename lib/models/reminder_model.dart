class Reminder {
  String text;
  DateTime date;

  Reminder({
    required this.text,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'date': date.toIso8601String(),
    };
  }

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      text: json['text'],
      date: DateTime.parse(json['date']),
    );
  }
}
