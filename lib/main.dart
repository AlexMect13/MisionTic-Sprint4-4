import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_gps/domain/controller_gps.dart';
import 'package:travel_gps/domain/controller_local.dart';

import 'UI/app.dart';

void main() {
  Get.put(ControllerGPS());
  Get.put(ControllerUbication());
  runApp(const App());
}
