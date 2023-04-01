import 'package:clean_air_and_weather/MyHomePage.dart';
import 'package:flutter/material.dart';



class PermissionScreen extends StatefulWidget {

  const PermissionScreen({super.key, required this.title});

  final String title;

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
  }

  class _PermissionScreenState extends State<PermissionScreen> {

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
  Image(image: AssetImage('assets/hand.png')),
  Padding(padding: EdgeInsets.only(top: 5.0)),
  Text(widget.title, style: TextStyle(fontSize: 22.0, color: Colors.white),),
  Padding(padding: EdgeInsets.only(top: 5.0)),
  Text('\nśledzenie jakości powietrza',
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
  margin: EdgeInsets.only(left: 10.0,right: 10.0),
  child: ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.purple),
    ),
    onPressed: () {
      //todo set permissions
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
    },
    child: Text('Zgoda na lokalizację'),

  ),
  ),
  )
  ]
  ,
  )
  );
  }
  }
