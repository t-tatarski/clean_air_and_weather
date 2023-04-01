import 'package:flutter/material.dart';
import 'main.dart';
import 'package:clean_air_and_weather/WeatherScreen.dart';
import 'Air.dart';



class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  var screens = [ Air(title: Strings.titleapp),WeatherScreen(title: Strings.titleapp)];

  void _incrementCounter() {
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index)=>setState(()=>_currentIndex=index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.masks_rounded),label: 'czystosc powietrza' ),
          BottomNavigationBarItem(icon: Icon(Icons.cloudy_snowing),label: 'pogoda' ),
        ],
      ),
    );
  }
}