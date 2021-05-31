import 'package:flutter/material.dart';
import 'package:to_doc_patient/screens/loginScreen.dart';
import 'package:to_doc_patient/screens/splashScreen.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/screens/registerScreen.dart';
import 'package:to_doc_patient/screens/forgotPassword.dart';
import 'package:to_doc_patient/screens/homeScreen.dart';
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
          '/registerScreen':(context)=> RegisterScreen(),
          '/forgotPasswordScreen':(context)=>ForgotPassword(),
          '/homeScreen':(context)=>HomeScreen(),
        },
        debugShowCheckedModeBanner: false,
      )
  );
}