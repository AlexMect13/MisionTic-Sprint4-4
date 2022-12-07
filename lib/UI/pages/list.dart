import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:travel_gps/domain/controller_local.dart';

class ListUbications extends StatelessWidget {
  const ListUbications({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerUbication Cp = Get.find();
    Cp.consultGral().then(((value) => null));

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.travel_explore_outlined,
          size: 30,
        ),
        title: const Text(
          'Travel GPS',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Cp.deleteAll().then((value) => Cp.consultGral());
            },
            icon: Icon(
              Icons.delete_rounded,
              color: Colors.red.shade900,
              size: 30,
            ),
          )
        ],
      ),
      body: Obx(() => ListView.builder(
            itemCount: Cp.ListPuntosGN?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1)
                        .toString() /*Cp.ListPuntosGN![index]['id'].toString()*/),
                  ),
                  title: Text(
                    Cp.ListPuntosGN![index]['detalle'],
                  ),
                  subtitle: Text(
                      "Longitud:  ${Cp.ListPuntosGN![index]['Longitude']}    Lantitude: ${Cp.ListPuntosGN![index]['Latitude']}      Precicion: ${Cp.ListPuntosGN![index]['Precitions']}   Fecha: ${Cp.ListPuntosGN![index]['Times']}"),
                  trailing: IconButton(
                    onPressed: () {
                      Cp.deletePunt(Cp.ListPuntosGN![index]['id'])
                          .then((Value) => Cp.consultGral());
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red.shade900,
                      size: 28,
                    ),
                  ),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/add');
        },
        child: const Icon(
          Icons.add_location_alt,
        ),
      ),
    );
  }
}
