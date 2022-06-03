import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/services/init_controllers.dart';
import 'package:flutter_getx_todo/services/route_name.dart';
import 'package:flutter_getx_todo/views/add_new_ui.dart';
import 'package:flutter_getx_todo/views/dashboard_ui.dart';
import 'package:flutter_getx_todo/views/remove_ui.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitControllers(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardUI(),
      getPages: [
        GetPage(name: RouteName.dashboardRoute, page: () => DashboardUI()),
        GetPage(name: RouteName.addNewRoute, page: () => AddNewUI()),
        GetPage(name: RouteName.removeRoute, page: () => RemoveUI()),
      ],
    );
  }
}
