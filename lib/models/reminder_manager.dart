import 'package:cn23_2_qualification/models/reminder_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert'; // for jsonEncode and jsonDecode

class ReminderManager {
  List<Reminder> reminders = [];

  Future<void> addReminder(String text) async {
    reminders.add(Reminder(text: text, date: DateTime.now()));
    await saveReminders(); // Save reminders after adding a new one.
  }

  Future<void> saveReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final remindersJson = reminders.map((reminder) => reminder.toJson()).toList();
    await prefs.setString('reminders', jsonEncode(remindersJson));
  }

  Future<void> loadReminders() async {
    final prefs = await SharedPreferences.getInstance();
    final remindersJson = prefs.getString('reminders');
    if (remindersJson != null) {
      final List<dynamic> decoded = jsonDecode(remindersJson);
      reminders = decoded.map((reminderJson) => Reminder.fromJson(reminderJson)).toList();
    }
  }
}
