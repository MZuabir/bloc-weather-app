import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LocationPermissionHandler {
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));
      Fluttertoast.showToast(
          backgroundColor: Colors.orange,
          msg: 'Location services are disabled. Please enable the services');
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context!).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        Fluttertoast.showToast(
          msg: 'Location permissions are denied',
          backgroundColor: Colors.orange,
        );
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location permissions are permanently denied, we cannot request permissions.')));
      Fluttertoast.showToast(
          backgroundColor: Colors.orange,
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }

    return true;
  }
}
