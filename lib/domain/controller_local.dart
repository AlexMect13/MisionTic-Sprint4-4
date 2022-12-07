import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/peticiones_db.dart';

class ControllerUbication extends GetxController {
  final Rxn<List<Map<String, dynamic>>> _listpuntos =
      Rxn<List<Map<String, dynamic>>>();

  List<Map<String, dynamic>>? get ListPuntosGN => _listpuntos.value;

  Future<void> consultGral() async {
    _listpuntos.value = await PeticionesDB.listpunts();
  }

  Future<void> addpunt(detalle, Longitude, Latitude, precition) async {
    await PeticionesDB.adicionar(detalle, Longitude, Latitude, precition)
        .then((Value) => Get.showSnackbar(GetSnackBar(
              title: 'Agregar Ubicacion',
              message: 'Ubicacion agregada',
              backgroundColor: Colors.blue.shade400,
              duration: const Duration(seconds: 4),
            )))
        .catchError((e) => Get.showSnackbar(GetSnackBar(
              title: 'Agregar Ubicacion',
              message: e,
              duration: const Duration(seconds: 4),
            )));
  }

  Future<void> deletePunt(id) async {
    await PeticionesDB.eliminar(id)
        .then((value) => Get.showSnackbar(GetSnackBar(
              title: 'Eliminar Ubicacion',
              message: 'Ubicacion Eliminada',
              backgroundColor: Colors.red.shade700,
              duration: const Duration(seconds: 4),
            )))
        .catchError((e) => null);
  }

  Future<void> deleteAll() async {
    await PeticionesDB.deleteall()
        .then((value) => Get.showSnackbar(GetSnackBar(
              title: 'Todas Ubicaciones',
              message: 'Se elimino todas las Ubicaciones',
              backgroundColor: Colors.red.shade900,
              duration: const Duration(seconds: 4),
            )))
        .catchError((e) => null);
  }
}
