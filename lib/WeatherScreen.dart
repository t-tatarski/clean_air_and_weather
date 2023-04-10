import 'package:clean_air_and_weather/PermissionScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'package:weather/weather.dart';


class WeatherScreen extends StatefulWidget {
  WeatherScreen({super.key, required this.title, required this.weather});
  final String title;
  final Weather weather;

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
         Padding(padding: EdgeInsets.only(top: 45.0)),
      Image(image: AssetImage('assets/${getIcon(widget.weather)}.png')),
         Padding(padding: EdgeInsets.only(top: 40.0)),
      Text('${(DateTime.now())}'),
      Text('pogoda: ${widget.weather.weatherDescription}'),
      Padding(padding: EdgeInsets.only(top: 30.0)),
      Text('${widget.weather.temperature?.celsius?.floor().toString()}',textAlign: TextAlign.center,
        style: TextStyle(fontSize: 46.0,color: Colors.white),
      ),
      Padding(padding: EdgeInsets.only(top: 20.0)),
      IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('cisnienie  '),
                  Padding(padding: EdgeInsets.only(top: 2.0)),
                  Text('${widget.weather.pressure} hPa')
                ],
              ),
            ),
            VerticalDivider(width: 10, thickness: 4,),
            Container(
              width: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('wiatr'),
                  Padding(padding: EdgeInsets.only(top: 2.0)),
                  Text('${widget.weather.windSpeed} m/s')
                ],
              ),
            )
          ],
        ),
      ),
         Padding(padding: EdgeInsets.only(top: 20.0)),
      if(widget.weather.rainLastHour != null)
      Text('opady: ${widget.weather.rainLast3Hours} mm/1h')
       else Text('brak opadów'),
      Padding(padding: EdgeInsets.only(top: 5.0)),
    ],
    ),
    ),
    Positioned(
    left: 0,
    bottom: 35,
    right: 0,
    child: Container(
    alignment: Alignment.center,
      child: Text('POGODA', style: TextStyle(fontSize: 16.0, color: Colors.white70),),
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

  String getIcon(Weather weather) {
    var main = weather.weatherMain;
    if(main == 'Clouds' || main == 'Snow'|| main == 'Drizzle'){
      return 'weather-rain';
    }else if (main == 'Thunderstorm'){
      return 'weather-lightning';
    }else{
      return'weather-sunny';
    }
  }
}
