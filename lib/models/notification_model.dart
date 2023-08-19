import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationModel {
  IconData icon;
  String title;
  String description;
  DateTime date;

  NotificationModel(
    { required this.icon,
      required this.title,
      required this.description,
      required this.date,
    }
  );
}