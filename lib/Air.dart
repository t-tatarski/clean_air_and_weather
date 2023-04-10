import 'package:clean_air_and_weather/PermissionScreen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'main.dart';


class Air extends StatefulWidget {
  const Air({super.key, required this.title});

  final String title;

  @override
  State<Air> createState() => _AirState();
}

class _AirState extends State<Air> {

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
                  colors: [new Color(0xff4ac8cc), new Color(0xff482dd9)]
                )
              )
    //
    ),
    Align(
       alignment: FractionalOffset.center,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text('jakość powietrza'),
         Padding(padding: EdgeInsets.only(top: 5)),
         Text('bardzo dobra', style: TextStyle(fontSize: 26, color: Colors.white)),
         Padding(padding: EdgeInsets.only(top: 25)),
         CircleAvatar(
           radius: 90,
           child: Center(
             child: Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('19', textAlign: TextAlign.center, style: TextStyle(fontSize: 60),),
                   Text('cad ', textAlign: TextAlign.center,),
                 ],
               ),
             ),
           ),
         ),
         Padding(padding: EdgeInsets.only(top: 20)),
         Text('nie wiem co to za dane'),
         Padding(padding: EdgeInsets.only(top: 20)),
         IntrinsicHeight(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 width: 130,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Text('PM 10'),
                     Padding(padding: EdgeInsets.only(top: 2.0)),
                     Text('000')
                   ],
                 ),
               ),
               VerticalDivider(width: 10, thickness: 4,),
               Container(
                 width: 130,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text('PM 2.5'),
                     Padding(padding: EdgeInsets.only(top: 2.0)),
                     Text(' 000'),
                   ],
                 ),
                 
               ),

             ],
           ),
         ),Padding(padding: EdgeInsets.only(top: 20)),
         new LinearPercentIndicator(
           width: 360.0,
           lineHeight: 19.0,
           percent: 0.2,
           backgroundColor: Colors.green,
           progressColor: Colors.red,
           linearStrokeCap: LinearStrokeCap.roundAll,

         ),
    ],
    ),
    ),
    Positioned(
    left: 0,
    bottom: 55,
    right: 0,
    child: Container(
    alignment: Alignment.center,
      child:
    ClipRect(
      child: Container(
        color: Colors.white70,
        padding: EdgeInsets.all(10.0),
        height: 38,
        child: Text('dobre powietrze na spacer'),
      ),
    ),
    ),
    )
        ],
        )
    );
  }

  bool havePermission() {
    return true;
  }
}
