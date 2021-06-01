import 'package:flutter/material.dart';
import 'package:to_doc_patient/screens/loginScreen.dart';
import 'package:to_doc_patient/screens/splashScreen.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/screens/registerScreen1.dart';
import 'package:to_doc_patient/screens/forgotPassword.dart';
import 'package:to_doc_patient/screens/homeScreen.dart';

import 'screens/registerScreen3.dart';
import 'screens/registerationScreen2.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: generateMaterialColor(Palette.kPrimaryColor),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/loginScreen': (context) => LoginScreen(),
      '/registerScreen1': (context) => RegisterScreen(),
      '/registerScreen2': (context) => RegisterScreenTwo(),
      '/registerScreen3': (context) => RegisterScreenThree(),
      '/forgotPasswordScreen': (context) => ForgotPassword(),
      '/homeScreen': (context) => HomeScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
