import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/covid_statistics_controller.dart';
import 'home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Covid-19 statics',
      initialBinding: BindingsBuilder(() {
        Get.put(CovidStatisticsController());
      }),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: HomeScreen(),
    );
  }
}
