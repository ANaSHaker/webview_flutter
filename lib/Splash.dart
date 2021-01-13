import 'package:flutter/material.dart';
import 'package:flutter_splash/flutter_splash.dart';


import 'Drawer.dart';




class Splassh extends StatefulWidget{
  @override
  _SplasshState createState() => _SplasshState();
}

class _SplasshState extends State<Splassh> {
  @override
  Widget build(BuildContext context) {
    return  Splash(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[800] : Colors.white,
      seconds: 3,
      navigateAfterSeconds:Draweer() ,
      image: Image.asset("assets/logo.png"),
      photoSize: 100,
      loaderColor: Colors.orange,
      loadingText: Text("المختصر لقطع الغيار",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
    );
  }
}