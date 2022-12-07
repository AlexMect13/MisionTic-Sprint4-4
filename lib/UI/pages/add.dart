import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travel_gps/domain/controller_gps.dart';
import 'package:travel_gps/domain/controller_local.dart';

class AddUbication extends StatefulWidget {
  const AddUbication({super.key});

  @override
  State<AddUbication> createState() => _AddUbicationState();
}

class _AddUbicationState extends State<AddUbication> {
  ControllerGPS Gps = Get.find();
  ControllerUbication cp = Get.find();

  TextEditingController NomUbication = new TextEditingController();
  TextEditingController Longitud = new TextEditingController(text: '0.0');
  TextEditingController Latitud = new TextEditingController(text: '0.0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAllNamed('/Lista');
            },
            icon: const Icon(Icons.home_sharp)),
        title: const Text('Adicionar Puntos'),
        actions: [
          IconButton(
              onPressed: () {
                Gps.ObtenerUbication().then((value) {
                  Longitud.text = Gps.log;
                  Latitud.text = Gps.lat;
                });
              },
              icon: const Icon(Icons.gps_fixed))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: [
            TextField(
                controller: NomUbication,
                decoration: const InputDecoration(
                    labelText: 'Ingrese un nombre para la Ubicacion')),
            TextField(
              controller: Longitud,
              textAlign: TextAlign.center,
              readOnly: true,
            ),
            TextField(
              controller: Latitud,
              textAlign: TextAlign.center,
              readOnly: true,
            ),
            const SizedBox(
              height: 13,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text(
                'Guardar Ubicacion',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                cp
                    .addpunt(
                      NomUbication.text,
                      Longitud.text,
                      Latitud.text,
                      Gps.precition,
                    )
                    .then((value) => cp.consultGral());
              },
            )
          ],
        ),
      ),
    );
  }
}
