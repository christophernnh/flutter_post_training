import 'package:cn23_2_qualification/models/vehicle_model.dart';
import 'package:flutter/material.dart';

class VehicleDetail extends StatefulWidget {
  final VehicleModel vehicle;
  const VehicleDetail({super.key, required this.vehicle});

  @override
  State<VehicleDetail> createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: 
      Column
      (children: 
        [
        const SizedBox(height: 20),
        Image.asset(widget.vehicle.image, height: 200, width: 400,),
        const SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.vehicle.odometer.toString() + " km",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5), // Optional spacing between main title and subtitle
                  Text(
                    "Odometer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Image.asset(widget.vehicle.fuelIndicator, height: 50, width: 100,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.vehicle.distanceToEmpty.toString() + " km",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5), // Optional spacing between main title and subtitle
                  Text(
                    "Distance to empty",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

            ],
            
          
        ),
        SizedBox(height: 30),
        const Text("Last updated today at 11:20 am."),
        SizedBox(height: 30),

        Expanded(
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color : Color.fromARGB(255, 255, 255, 255),
              ),
              padding: const EdgeInsets.all(20.0),
              child: 
              Column(children: [
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        // SizedBox(height: 10),
                        const Text("Remote Services", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        SizedBox(height: 20),
                        Image.asset("assets/start_stop_button.png", height: 130, width: 130,),
                        SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Transform.scale(
                                scale: 1.5, // Adjust the scale factor as needed
                                child: Icon(Icons.lock),
                              ),
                              Transform.scale(
                                scale: 1.5, // Adjust the scale factor as needed
                                child: Icon(Icons.lock_open),
                              ),
                            ],
                          ),
                        )



                      ],
                    ),
                  ),
                ),
              ]),
            ),
        ),

        ],
      
      ),
    );
  }
}