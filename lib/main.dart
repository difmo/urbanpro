import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urbanpro/routes/app_routes.dart';
import 'routes/app_pages.dart';
import 'bindings/initial_bindings.dart';

void main() {
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with GetX',
      initialRoute: AppRoutes.SPLASHSCREEN,
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
