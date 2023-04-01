import 'package:clean_air_and_weather/PermissionScreen.dart';
import 'package:clean_air_and_weather/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'main.dart';



class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  void _incrementCounter() {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Text('test'),
     ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index)=>setState(()=>_currentIndex=index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.masks_rounded),label: 'czystosc pow' ),
          BottomNavigationBarItem(icon: Icon(Icons.cloudy_snowing),label: 'pogoda' ),
        ],
      ),
    );
  }
}