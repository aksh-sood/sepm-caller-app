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
        appBar: AppBar(
          title: Text('Log In'),
        ),
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/doctor.jpg'),
            fit: BoxFit.cover,
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: Container(
            padding: EdgeInsets.all(kDefaultPadding),
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                SizedBox(height: 120.0),
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
                ),
                SizedBox(height: 20.0),
                Row(
                   children: [
                     Expanded(
                       child: ElevatedButton(
                          onPressed: (){

                          },
                         style:ElevatedButton.styleFrom(
                           padding: EdgeInsets.all(kDefaultButtonPadding ),
                           shape:RoundedRectangleBorder(
                             borderRadius:BorderRadius.circular(kDefaultBorderRadius) ),
                         ),
                         child: Text("Forgot password?",style: kButtonTextStyle,),
                       ),
                     ),
                     SizedBox(width: 10.0),
                     Expanded(
                       child: ElevatedButton(
                         onPressed: (){

                         },
                         style:ElevatedButton.styleFrom(
                           padding: EdgeInsets.all(kDefaultButtonPadding ),
                           shape:RoundedRectangleBorder(
                             borderRadius:BorderRadius.circular(kDefaultBorderRadius) ),
                         ),
                         child: Text("New here? Register", style: kButtonTextStyle,),
                       ),
                     )
                   ],
                )
              ],
            ),
          ),
        ),
    );

  }
}