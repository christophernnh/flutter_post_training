import 'package:flutter/material.dart';
import 'package:cn23_2_qualification/models/reminder_manager.dart';

class VehicleReminder extends StatefulWidget {
  const VehicleReminder({super.key});

  @override
  State<VehicleReminder> createState() => _VehicleReminderState();
}

class _VehicleReminderState extends State<VehicleReminder> {
  ReminderManager reminderManager = ReminderManager();

  TextEditingController reminderController = TextEditingController();

  bool isRemindersLoaded = false;

  void _loadRemindersIfNeeded() {
    if (!isRemindersLoaded) {
      reminderManager.loadReminders();
      isRemindersLoaded = true;
    }
  }

  void _addReminder() {
    if (reminderController.text.isNotEmpty) {
      setState(() {
        reminderManager.addReminder(reminderController.text);
        reminderController.clear();
      });
    } else {
      _showEmptyReminderSnackbar();
    }
  }

  void _showEmptyReminderSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please fill in reminder field.'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadRemindersIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: TextField(
            controller: reminderController,
            decoration: InputDecoration(
              labelText: 'Enter Reminder',
              suffixIcon: IconButton(
                onPressed: _addReminder,
                icon: Icon(Icons.add),
              ),
            ),
            onSubmitted: (_) => _addReminder(),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: reminderManager.reminders.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(reminderManager.reminders[index].text),
                subtitle: Text(
                  'Posted at: ${reminderManager.reminders[index].date.toString()}',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Vehicle Reminder')),
      body: VehicleReminder(),
    ),
  ));
}
