
import 'package:api_weatherapp/screens/initial_screen.dart';
import 'package:api_weatherapp/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: InitialScreen(),
      home: InitialScreen(),
    );
  }
}
