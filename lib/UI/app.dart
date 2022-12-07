import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'pages/add.dart';
import 'pages/list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ubicacion GPS',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: const ListUbications(),
      routes: {
        'Lista': (context) => const ListUbications(),
        '/add': (Context) => const AddUbication(),
      },
    );
  }
}
