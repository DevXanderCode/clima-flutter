import 'package:geolocator/geolocator.dart';

void getLocation() async {
  // await Geolocator.openAppSettings();
  // await Geolocator.openLocationSettings();
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  } catch (e) {
    print(e);
  }
}
