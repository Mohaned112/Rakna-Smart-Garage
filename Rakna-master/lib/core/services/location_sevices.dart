import 'package:location/location.dart';

class LocationServices {
  Future<LocationData> getLocation() async {
    Location location = Location();
    bool _serviceEnable;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    _serviceEnable = await location.serviceEnabled();
    if (!_serviceEnable) {
      _serviceEnable = await location.requestService();
      if (!_serviceEnable) {
        throw Exception();
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception();
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}
