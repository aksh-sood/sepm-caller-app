import 'package:flutter/material.dart';
import 'package:to_doc/utilities/constants.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/doctor.jpg'),
            fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  SizedBox(height: 200.0),
                  TextField(
                    scrollPadding: EdgeInsets.all(kDefaultPadding),
                    style: TextStyle(
                       color: Colors.black
                    ),
                    decoration: kInputPhoneDecoration,
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    style: TextStyle(
                        color: Colors.black
                    ),
                    decoration: kInputPasswordDecoration,
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: (){

                            },
                            child:Text(
                                "Log In",style: kButtonTextStyle,
                            ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(kDefaultButtonPadding ),
                            shape:RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(kDefaultBorderRadius),
                          ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
    );

  }
}