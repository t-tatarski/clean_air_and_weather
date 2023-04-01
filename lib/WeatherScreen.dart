import 'package:clean_air_and_weather/PermissionScreen.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.title});

  final String title;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: new Color(0xffffffff),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [new Color(0xff6e6cd8), new Color(0xff77e1ee)]
                )
              )
    //
    ),
    Align(
       alignment: FractionalOffset.center,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
       children: [
      Image(image: AssetImage('assets/cloud-sun.png')),
      Padding(padding: EdgeInsets.only(top: 5.0)),
      Text(widget.title, style: TextStyle(fontSize: 22.0, color: Colors.white),),
      Padding(padding: EdgeInsets.only(top: 5.0)),
    Text('\n POGODA',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16.0,color: Colors.white60),
    )
    ],
    ),
    ),
    Positioned(
    left: 0,
    bottom: 35,
    right: 0,
    child: Container(
    alignment: Alignment.center,
      child: Text('dane o czystości powietrza..', style: TextStyle(fontSize: 16.0, color: Colors.yellow),),
    ),
    )
        ]
          ,
        )
    );
  }

  bool havePermission() {
    return true;
  }
}
