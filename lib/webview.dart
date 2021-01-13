import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import 'package:webview_flutter/webview_flutter.dart';




class MyHomePage extends KFDrawerContent {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("تحقق امنياتي"),
        backgroundColor:Color(0xff0a142d),
        centerTitle: true,
        leading:   IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: widget.onMenuPressed,),
      ),


      body:     MyPlaceholderWidget('https://api.learn-english-academy.com/'),



    );
  }
}



class MyPlaceholderWidget extends StatelessWidget {

  var url = 'https://api.learn-english-academy.com/'  ;
  final key = UniqueKey();

  MyPlaceholderWidget(String url){
    this.url = url ;
  }

  @override
  Widget build(BuildContext context) {

    return WebView(
        key: key,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
        onWebViewCreated: (WebViewController webViewController){
        });


  }



}