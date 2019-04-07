import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:recappture2/model/my_data.dart';


Future<String> getLocationStatus() async {
  GeolocationStatus status = await Geolocator().checkGeolocationPermissionStatus();

  if (status == GeolocationStatus.denied) {
    // Take user to permission settings
    return 'Denied';
  } else if (status == GeolocationStatus.disabled) {
    // Take user to location page
    return 'Disabled';
  } else if (status == GeolocationStatus.restricted) {
    // Restricted
    return 'Restricted';
  } else if (status == GeolocationStatus.unknown) {
    // Unknown
    return 'Unknown';
  } else {
    return 'Enabled';
  }
}

//get location
Future<String> getLocation() async {
  String myLocation;
  try {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    MyData.lat = position.latitude;
    MyData.lng = position.longitude;
    myLocation = await getAddress(position.latitude, position.longitude);
    MyData.location = myLocation;
  } catch (e) {
    myLocation = e;
  }

  return myLocation;
}

//get address
Future<String> getAddress(double lat, double lng) async {
  List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(lat, lng, localeIdentifier: 'sl_SI');
  String postCode = placemark[0].postalCode;
  String adminArea = placemark[0].administrativeArea;
  String address = placemark[0].thoroughfare;
  String houseNo = placemark[0].subThoroughfare;
  String location = address + ' ' + houseNo + ', ' + postCode + ' ' + adminArea;
  return location;
}