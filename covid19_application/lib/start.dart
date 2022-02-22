import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 statics',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: null,
    );
  }
}
