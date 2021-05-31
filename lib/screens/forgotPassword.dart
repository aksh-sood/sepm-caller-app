import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String phoneOrEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Palette.kPrimaryColor
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(icon: Icon(Icons.arrow_back_ios),color: Palette.kWhite,
                          onPressed: (){
                            Navigator.pop(context);
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Forgot",
                        style:kBigHeadingTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Password",
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
                              topRight: Radius.circular(kCircularRadius)
                          )
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(kPaddingLevel2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 60.0,
                              ),

                              TextField(
                                scrollPadding: EdgeInsets.all(kDefaultPadding),
                                style: kTextFieldStyle,
                                onChanged: (value){
                                  phoneOrEmail=value;
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Palette.kSecondaryColor,
                                    hintText:"Enter Email",
                                    hintStyle: kHintTextStyle,
                                    border:OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(kCircularRadius)),
                                        borderSide: BorderSide.none
                                    )
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {

                                      }, child: Text(
                                      "Submit",style: kButtonLightTextStyle,
                                    ),
                                      style: ElevatedButton.styleFrom(
                                        //primary: Palette.kSecondaryColor,
                                          padding: EdgeInsets.all(kDefaultButtonPadding ),

                                          shape:RoundedRectangleBorder(
                                            borderRadius:BorderRadius.circular(kDefaultBorderRadius),
                                          ),
                                      )

                                    ),
                                  ),
                                ],
                              )

                            ],

                          ),
                        ),
                      ),

                    )
                )
              ])),
    );
  }
}
