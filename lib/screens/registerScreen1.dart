import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/inputTile.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscure = true;
  String phone = '';
  String email = '';
  String password = '';
  String city = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Palette.kPrimaryColor),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Palette.kWhite,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Register",
                      style: kBigHeadingTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome to To-Doc",
                      style: kNormalHeadingTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Palette.kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kCircularRadius),
                        topRight: Radius.circular(kCircularRadius))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(kPaddingLevel2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InputTile(
                          isObscure: false,
                          inputType: "Enter Phone No.",
                          variable: phone,
                          textLength: [LengthLimitingTextInputFormatter(10)],
                        ),
                        SizedBox(height: 20.0),
                        InputTile(
                          variable: email,
                          inputType: "Enter Email ",
                          isObscure: false,
                        ),
                        SizedBox(height: 20.0),
                        InputTile(
                          inputType: "Enter Password",
                          variable: password,
                          isObscure: _isObscure,
                          tileIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                        ),
                        SizedBox(height: 20.0),
                        InputTile(
                          inputType: "Enter City",
                          variable: city,
                          isObscure: false,
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                child: Text(
                                  "Register",
                                  style: kButtonLightTextStyle,
                                ),
                                style: ElevatedButton.styleFrom(
                                  //primary: Palette.kSecondaryColor,
                                  padding:
                                      EdgeInsets.all(kDefaultButtonPadding),

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        kDefaultBorderRadius),
                                  ),
                                ),
                                onPressed: () async {
                                  var msg;
                                  User user = User.a(
                                      phone: phone,
                                      email: email,
                                      password: password,
                                      city: city);
                                  var response = await user.registerUser();
                                  if (response['success'] == 'no') {
                                    msg = response['error'];
                                  } else {
                                    msg = response['message'];
                                    Navigator.pop(context);
                                  }
                                  Fluttertoast.cancel();
                                  Fluttertoast.showToast(
                                      msg: "$msg",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor:
                                          Palette.kContentColorDarkThemeColor,
                                      textColor: Palette.kWhite,
                                      fontSize: 16.0);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ])));
  }
}

//  TextField(
//                     style: kTextFieldStyle,
//                     onChanged: (value){
//                       // password=value;
//                     },
//                     obscureText: _isObscure,
//                     decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Palette.kSecondaryColor,
//                         hintText:"Enter Password",
//                         hintStyle: kHintTextStyle,
//                         suffixIcon: IconButton(
//                             icon: Icon(
//                                 _isObscure ? Icons.visibility : Icons.visibility_off),
//                             onPressed: () {
//                               // setState(() {
//                               //   _isObscure = !_isObscure;
//                               // });
//                             }),
//                         border:OutlineInputBorder(
//                             borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                             borderSide: BorderSide.none
//                         )
//                     ),
//                   ),
