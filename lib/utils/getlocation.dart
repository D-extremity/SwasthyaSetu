import 'package:geocode/geocode.dart';
import 'package:location/location.dart';

Location location = Location();
late bool _serviceEnabled;
late PermissionStatus _permissionGranted;
late LocationData locationData;
Future<dynamic> getLocation() async {
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return ;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }

  locationData = await location.getLocation();
  GeoCode geoCode = GeoCode();
  Address address = await geoCode.reverseGeocoding(
    latitude: locationData.latitude!,
    longitude: locationData.longitude!,
  );
  // print(locationData);
  // print(address.streetAddress);
  return address.streetAddress;
}
