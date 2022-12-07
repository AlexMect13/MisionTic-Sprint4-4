import 'package:get/get.dart';
import 'package:location/location.dart';

class ControllerGPS extends GetxController {
  final _lat = "".obs;
  final _log = "".obs;
  final _precition = "".obs;
  final _time = "".obs;

  String get lat => _lat.value;
  String get log => _log.value;
  String get precition => _precition.value;
  String get time => _time.value;

  Future<void> ObtenerUbication() async {
    final LocationData position;
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGratend;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGratend = await location.hasPermission();
    if (permissionGratend == PermissionStatus.denied) {
      permissionGratend = await location.requestPermission();
      if (permissionGratend == PermissionStatus.granted) {
        return;
      }
    }

    position = await location.getLocation();
    _log.value = position.longitude.toString();
    _lat.value = position.latitude.toString();
    _precition.value = position.accuracy.toString();
  }
}
