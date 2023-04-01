import 'package:clean_air_and_weather/PermissionScreen.dart';
import 'package:flutter/material.dart';
import 'main.dart';


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
        Navigator.push(
        context, MaterialPageRoute(
            builder: (context)=>PermissionScreen(title: Strings.titleapp))
    ),
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

  bool havePermission() {
    return true;
  }
}
