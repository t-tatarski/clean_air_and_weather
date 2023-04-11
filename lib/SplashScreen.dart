
import 'dart:convert';

import 'package:clean_air_and_weather/MyHomePage.dart';
import 'package:clean_air_and_weather/PermissionScreen.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'main.dart';
import 'package:weather/weather.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.title});

  final String title;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {



    new Future.delayed(const Duration(seconds: 5),
        ()=>{
      if(havePermission()){
        executeOnceAfterBuild(),
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Permissions granted')))
      }else{
        // todo prefatching
        Navigator.push(
        context, MaterialPageRoute(
            builder: (context)=>PermissionScreen(title: Strings.titleapp))
          ),
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('you don\'t have permissions')))
         }
        }
    );


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
                  colors: [new Color(0xff6671e5), new Color(0xff482dd9)]
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
    Text('\naplikacja do monitorowaia\nczystosci powietrza',
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
      child: Text('przywiewam dane...', style: TextStyle(fontSize: 16.0, color: Colors.yellow),),
    ),
    )
        ]
          ,
        )
    );
  }

  @override
  void initState() {
    super.initState();
    executeOnceAfterBuild();
  }
   bool havePermission() {    return true; }



  Future<void> executeOnceAfterBuild() async {
    WeatherFactory weatherFactory = new WeatherFactory('cde0b2884233a7911305176cf7f7843d', language: Language.POLISH);
    Weather weather = await weatherFactory.currentWeatherByCityName('Kielce');
    // 255bd651d082759d6d7295555795ed63193803a2 token czystosci powietrza
    //50°52'10.1"N 20°36'10.3"E    50.869459, 20.602851
    var _endpoint = 'https://api.waqi.info/feed/';
    var lat = 50.869459;
    var lon = 20.602851;
    var keyword = 'geo:$lat;$lon';
    var key = '255bd651d082759d6d7295555795ed63193803a2';
    String url = '$_endpoint/$keyword/?token=$key';
    http.Response response = await http.get(Uri.parse(url));
    Map <String, dynamic> jsonbody = json.decode(response.body);
    AirQuality sq = new AirQuality(jsonbody);

    var logger = Logger();
    logger.e(response.body.toString());
    logger.d(weather.toJson().toString());
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage( weather: weather)));

  }
}
class AirQuality{
  bool isGood = false;
  bool isBad = false;
  String quality = "";
  String advice = "";
  int aqi = 0;
  int mp25 = 0;
  int pm10 = 0;
  String station = "";

  AirQuality(Map<String, dynamic> jsonbody);
}
