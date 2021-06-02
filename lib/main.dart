import 'package:flutter/material.dart';
import 'package:to_doc_patient/screens/loginScreen.dart';
import 'package:to_doc_patient/screens/splashScreen.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/screens/registerPersonalDetails.dart';
import 'package:to_doc_patient/screens/forgotPassword.dart';
import 'package:to_doc_patient/screens/homeScreen.dart';

import 'screens/registerScheduleDetails.dart';
import 'screens/registerSpecificationDetails.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: generateMaterialColor(Palette.kPrimaryColor),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/loginScreen': (context) => LoginScreen(),
      '/registerScreen1': (context) => RegisterScreen(), //added by aksh
      '/registerScreen2': (context) => RegisterSpecialization(), //added by aksh
      '/registerScreen3': (context) => RegisterSchedule(), //added by aksh
      '/forgotPasswordScreen': (context) => ForgotPassword(),
      '/homeScreen': (context) => HomeScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
