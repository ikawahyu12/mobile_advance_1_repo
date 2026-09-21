import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/demoController.dart';
import 'view/home.dart';
import 'view/demoPage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DemoController ctrl = Get.put(DemoController());

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(
      builder: (context) {
        // for darkmode
        return GetMaterialApp(
          // navigation dont forget to use GetMaterialApp
          title: 'GetX',
          theme: ctrl.theme,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/cart': (context) => DemoPage(),
          },
        );
      },
    );
  }
}