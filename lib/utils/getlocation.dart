import 'package:geocode/geocode.dart';
import 'package:location/location.dart';

Location location = Location();
late bool _serviceEnabled;
late PermissionStatus _permissionGranted;
late LocationData locationData;
Future<String> getLocation() async {
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return "Please Give Location Access";
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return "Please Give Location Access";
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
  return address.streetAddress.toString();
}
