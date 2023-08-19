import 'package:cn23_2_qualification/pages/vehicle_detail_main.dart';
import 'package:flutter/material.dart';
import 'package:cn23_2_qualification/models/vehicle_model.dart';
import 'package:cn23_2_qualification/pages/vehicle_detail.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({super.key});

  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  List<VehicleModel> vehicles = [
    VehicleModel(
      name: "Innova Zenix",
      year: "2023",
      image: "assets/zenix.png",
      odometer: 3457,
      distanceToEmpty: 604,
      fuelIndicator: "assets/fuel_full.png"
    ),
    VehicleModel(
      name: "Camry",
      year: "2019",
      image: "assets/camry.png",
      odometer: 45671,
      distanceToEmpty: 245,
      fuelIndicator: "assets/fuel_half.png"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: vehicles.length,
                  itemBuilder: (context, index) {
                    VehicleModel currentVehicle = vehicles[index];
                     return GestureDetector(
                      onTap: () {
                        // Navigate to the detail page on tap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => vehicleDetailMain(vehicle: currentVehicle),
                          ),
                        );
                      },
                      child: Container(
                        height: 120, 
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: Image.asset(currentVehicle.image, scale: 0.75), 
                          title: Text(
                            currentVehicle.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            currentVehicle.year,
                            style: TextStyle(
                              fontSize: 16, // Increase the font size
                              fontWeight: FontWeight.normal, // Optionally adjust the font weight
                            ),
                          ),
                          trailing: Icon(
                            Icons.more,
                            size: 22, // Increase the size of the icon
                          ),
                        ),
                      ),

                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                // Add your button's onPressed logic here
              },
              child: 
              Icon(Icons.add, color: Theme.of(context).colorScheme.background,),
            ),
          ),
        ],
      ),
    );
  }
}
