import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_doc/utilities/constants.dart';
import 'package:to_doc/utilities/pallete.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
    ()=>Navigator.pushReplacementNamed(context,'/loginscreen'));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color:Palette.kContentColorDarkTheme,
      ),
      child: Center(
        child:Image.asset('images/logo.png') ,
      ),
    );
  }
}
