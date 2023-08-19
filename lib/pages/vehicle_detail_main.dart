import 'package:cn23_2_qualification/pages/vehicle_detail.dart';
import 'package:cn23_2_qualification/pages/vehicle_reminder.dart';
import 'package:cn23_2_qualification/models/vehicle_model.dart';
import 'package:flutter/material.dart';

class vehicleDetailMain extends StatefulWidget {
  final VehicleModel vehicle;
  const vehicleDetailMain({super.key, required this.vehicle});


  @override
  State<vehicleDetailMain> createState() => _vehicleDetailMainState();
}

class _vehicleDetailMainState extends State<vehicleDetailMain> {
  int selectedPage = 0;


  @override
  Widget build(BuildContext context) {
      List<Widget> pages = [
          VehicleDetail(vehicle: widget.vehicle),
          VehicleReminder(),
      ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade800,),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/toyotalogo.png',
              fit: BoxFit.contain,
              height: 35,
            ),
            Text(
              widget.vehicle.name,
              style: TextStyle(fontSize: 17, color: Colors.black87),
            ),
          ],
        ),
      ),
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value){
            setState(() {
              selectedPage = value;
            });
          },
          
          currentIndex: selectedPage,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
    
          items: [
          BottomNavigationBarItem(
            label: "My Car",
            icon: Icon(Icons.car_crash),
            activeIcon: Icon(Icons.car_crash_outlined),
          ),
          BottomNavigationBarItem(
            label: "Reminders",
            icon: Icon(Icons.notification_important),
            activeIcon: Icon(Icons.notification_important_outlined),
          ),
        ]),
    );
  }
}