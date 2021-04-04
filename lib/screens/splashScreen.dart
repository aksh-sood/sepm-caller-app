import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/pallete.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
    ()=>Navigator.pushReplacementNamed(context,'/loginScreen'));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color:Palette.kPrimaryColor,
      ),
      child: Center(
        child:Image.asset('images/logo.png') ,
      ),
    );
  }
}
