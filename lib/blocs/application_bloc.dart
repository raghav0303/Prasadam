import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prasadam/services/geolocator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApplicationBloc with ChangeNotifier{
  final geoLocatorService = GeolocatorService();

  //Variables
  Position? currentLocation;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async{
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}