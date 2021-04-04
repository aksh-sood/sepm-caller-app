import 'package:flutter/material.dart';
import 'package:to_doc/utilities/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true;
  String phone;
  String email;
  String password;
  String city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
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
                      phone=value;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText:"Enter Phone no.",
                        hintStyle: kHintTextStyle,
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide.none
                        )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    scrollPadding: EdgeInsets.all(kDefaultPadding),
                    style: kTextFieldStyle,
                    onChanged: (value){
                      email=value;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText:"Enter Email",
                        hintStyle: kHintTextStyle,
                        border:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide.none
                        )
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    style: kTextFieldStyle,
                    onChanged: (value){
                      password=value;
                    },
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
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
                  TextField(
                    scrollPadding: EdgeInsets.all(kDefaultPadding),
                    style: kTextFieldStyle,
                    onChanged: (value){
                      city=value;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText:"Enter city",
                        hintStyle:kHintTextStyle,
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
                            "Register",style: kButtonTextStyle,
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
                ]
            ),
          ),
        )
    );
  }
}

