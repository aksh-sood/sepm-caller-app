import 'package:flutter/material.dart';
import 'package:to_doc/screens/loginScreen.dart';
import 'package:to_doc/screens/splashScreen.dart';
import 'package:to_doc/utilities/pallete.dart';
void main() {
  runApp(
      MaterialApp(
        theme: ThemeData(
            primarySwatch:generateMaterialColor(Palette.kPrimaryColor),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Splash(),
          '/loginscreen': (context) => LoginScreen(),
        },
        debugShowCheckedModeBanner: false,
      )
  );
}