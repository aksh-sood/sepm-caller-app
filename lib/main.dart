import 'package:flutter/material.dart';
import 'package:to_doc/screens/loginScreen.dart';
import 'package:to_doc/screens/splashScreen.dart';

void main() {
  runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
          '/loginscreen': (context) => LoginScreen(),
        },
        debugShowCheckedModeBanner: false,
      )
  );
}