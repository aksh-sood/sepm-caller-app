import 'package:flutter/material.dart';
import 'package:to_doc/utilities/pallete.dart';
import 'package:to_doc/utilities/constants.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  String phoneOrEmail;
  String password;
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
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
              children: [
            TextField(
            scrollPadding: EdgeInsets.all(kDefaultPadding),
            style: kTextFieldStyle,
            onChanged: (value){
              phoneOrEmail=value;
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Palette.kWhite,
                hintText:"Enter Phone/Email",
                hintStyle: kHintTextStyle,
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide.none
                )
            ),
        ),
      SizedBox(height: 20.0),
      TextField(
        style:kTextFieldStyle,
        onChanged: (value){
          password=value;
        },
        obscureText: _isObscure,
        decoration: InputDecoration(
            filled: true,
            fillColor: Palette.kWhite,
            hintText:"Enter Password",
            hintStyle: kHintTextStyle,
            suffixIcon: IconButton(
                icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            border:OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide.none
            )
        ),
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
                  Navigator.pushNamed(context,'/registerScreen');
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
        ]
            ),
          ),
        )
    );
  }
}