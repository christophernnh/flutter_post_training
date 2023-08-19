import 'package:cn23_2_qualification/models/notification_model.dart';
import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<NotificationModel> notifications = [
    NotificationModel(
      icon: Icons.car_repair,
      title: "Innova Zenix - 5000 km service required",
      description: "Please head to your nearest Toyota dealer.", 
      date: DateTime.now(),
    ),
    NotificationModel(
      icon: Icons.error,
      title: "Innova Zenix - Doors unlocked",
      description: "Please check you doors.", 
      date: DateTime.now(),
    ),
    NotificationModel(
      icon: Icons.map,
      title: "Camry - Boundaries exceeded",
      description: "Your car has exceeded the geolocation boundary.", 
      date: DateTime.now(),
    ),
    NotificationModel(
      icon: Icons.error,
      title: "Camry - Hood not closed.",
      description: "Please check your car's hood.", 
      date: DateTime.now(),
    ),
    NotificationModel(
      icon: Icons.tire_repair,
      title: "Innova Zenix - Low Tire Pressure",
      description: "Restore pressure in left-rear tire.", 
      date: DateTime.now(),
    ),
    NotificationModel(
      icon: Icons.local_gas_station,
      title: "Camry - Fuel low",
      description: "Head to your nearest gas station.", 
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context,index){
                NotificationModel currentNotification = notifications[index];
                return ListTile(
                  textColor: Theme.of(context).colorScheme.secondary,
                  onTap: (){},  
                  leading: Icon(currentNotification.icon),
                  title: Text(currentNotification.title),
                  subtitle: Text(currentNotification.description),
                  // trailing: Text(currentNotification.date.toString()),
                );
              },
            ),
          )
        ]),
    );
  }
}