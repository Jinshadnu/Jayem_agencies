import 'package:flutter/material.dart';

class StartTransportProvider with ChangeNotifier {
  String? driver;
  String? vehicle;
  String? warehouse;
  String? destinationStore;
  String? startReading;

  void setDriver(String value) {
    driver = value;
    notifyListeners();
  }

  void setVehicle(String value) {
    vehicle = value;
    notifyListeners();
  }

  void setWarehouse(String value) {
    warehouse = value;
    notifyListeners();
  }

  void setDestinationStore(String value) {
    destinationStore = value;
    notifyListeners();
  }

  void setStartReading(String value) {
    startReading = value;
    notifyListeners();
  }

  void submitTransport() {
    // Add submission logic here
    print("Transport started with: $driver, $vehicle, $warehouse, $destinationStore, $startReading");
  }
}
