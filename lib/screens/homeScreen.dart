import 'package:flutter/material.dart';
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/services/secureStorage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String user;
  String password;
  void initState(){
    super.initState();
    getData();
  }
  void getData() async{
    Map userdetails = await SecureStorage().readUserDetails();
    setState(() {
      user=userdetails['phoneOrEmail'];
      password=userdetails['password'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Center(
            child: Text("$user - $password",style: kBigHeadingTextStyle),
          ),

        ],
      ),
    );
  }
}
