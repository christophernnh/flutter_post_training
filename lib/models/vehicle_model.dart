class VehicleModel {
  String name;
  String year;
  String image;
  int odometer;
  int distanceToEmpty;
  String fuelIndicator;

  VehicleModel(
    {required this.name,
      required this.year,
      required this.image,
      required this.odometer,
      required this.distanceToEmpty,
      required this.fuelIndicator
    }
  );
}