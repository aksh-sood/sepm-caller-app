import 'package:flutter/material.dart';
import 'package:to_doc_patient/screens/loginScreen.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/screens/registerPersonalDetails.dart';
import 'package:to_doc_patient/screens/forgotPassword.dart';
import 'package:to_doc_patient/screens/homeScreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: generateMaterialColor(Palette.kPrimaryColor),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => LoginScreen(),
      '/registerScreen1': (context) => RegisterScreen(), //added by aksh
      '/forgotPasswordScreen': (context) => ForgotPassword(),
      '/homeScreen': (context) => HomeScreen(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
