import 'dart:async';

import 'package:location/location.dart';

import 'location.dart';

class LocationService extends ILocation {
  final Location _location = Location();

  StreamSubscription? _positionStream;

  LocationService() {
    _location.changeSettings(
      accuracy: LocationAccuracy.navigation,
      interval: 1,
      distanceFilter: 0,
    );
  }

  Future<bool> canStart() async {
    bool serviceEnabled = await _location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();

      if (!serviceEnabled) {
        return false;
      }
    }

    PermissionStatus permissionGranted = await _location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }

    return true;
  }

  listenForPosition(Function(LocationData) onPositionChanged) {
    _positionStream = _location.onLocationChanged.listen(onPositionChanged);
  }

  @override
  cancelListener() {
    _positionStream?.cancel();
  }
}
