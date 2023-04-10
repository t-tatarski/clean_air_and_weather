import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'WeatherScreen.dart';
import 'main.dart';
import 'Air.dart';


class MyHomePage extends StatefulWidget {
 MyHomePage({required this.weather});
 final Weather weather;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  var screens;

  @override
  void initState() {
   screens =  [ Air(title: Strings.titleapp),WeatherScreen(title: Strings.titleapp, weather: widget.weather)];
   super.initState();
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