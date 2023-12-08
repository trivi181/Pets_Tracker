import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationManager {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

 double calculateDistance(LatLng start, LatLng end) {
  final Distance distance = Distance();
  return distance.as(LengthUnit.Meter, start, end);
  }
}
