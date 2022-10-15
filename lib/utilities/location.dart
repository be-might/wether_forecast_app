import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longtitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 5));

      latitude = position.latitude;
      longtitude = position.longitude;
    } catch (e) {
      throw 'Something went wrong $e';
    }
  }
}
