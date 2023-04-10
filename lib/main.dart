import 'package:clean_air_and_weather/SplashScreen.dart';
import 'package:clean_air_and_weather/WeatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:clean_air_and_weather/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.titleapp,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home:  WeatherScreen(title: Strings.titleapp),
      home:  SplashScreen(title: Strings.titleapp),
    );
  }
}
class Strings {
  static const String titleapp= 'Clean Air and Weather';
}
