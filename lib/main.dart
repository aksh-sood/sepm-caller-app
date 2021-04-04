import 'package:flutter/material.dart';
import 'package:to_doc_patient/screens/loginScreen.dart';
import 'package:to_doc_patient/screens/splashScreen.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/screens/registerScreen.dart';
void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch:generateMaterialColor(Palette.kPrimaryColor),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
          '/loginScreen': (context) => LoginScreen(),
          '/registerScreen':(context)=> RegisterScreen()
        },
        debugShowCheckedModeBanner: false,
      )
  );
}