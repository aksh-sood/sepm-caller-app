import 'package:flutter/material.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_doc_patient/models/user.dart';
import 'package:to_doc_patient/services/secureStorage.dart';

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
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Palette.kPrimaryColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Login",
                    style: kBigHeadingTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome back",
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
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                            ),
                            TextField(
                              scrollPadding: EdgeInsets.all(kDefaultPadding),
                              style: kTextFieldStyle,
                              onChanged: (value) {
                                phoneOrEmail = value;
                              },
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Palette.kSecondaryColor,
                                  hintText: "Enter Phone/Email",
                                  hintStyle: kHintTextStyle,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(kCircularRadius)),
                                      borderSide: BorderSide.none)),
                            ),
                            SizedBox(height: 20.0),
                            TextField(
                              style: kTextFieldStyle,
                              onChanged: (value) {
                                password = value;
                              },
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Palette.kSecondaryColor,
                                  hintText: "Enter Password",
                                  hintStyle: kHintTextStyle,
                                  suffixIcon: IconButton(
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(kCircularRadius)),
                                      borderSide: BorderSide.none)),
                            ),
                            SizedBox(height: 40.0),
                            TextButton(
                              onPressed: () async {
                                var msg;
                                User user = User.b(
                                    phoneOrEmail: phoneOrEmail,
                                    password: password);
                                var response = await user.logInUser();
                                if (response['success'] == 'no') {
                                  msg = response['error'];
                                } else {
                                  msg = response['message'];
                                  Navigator.pushReplacementNamed(
                                      context, '/homeScreen');
                                  SecureStorage().saveUserLoginDetails(
                                      phoneOrEmail, password);
                                }
                                //Fluttertoast.cancel();
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
                              child: Text(
                                "LogIn",
                                style: kButtonTextStyle,
                              ),
                            ),
                            //Divider(thickness: 1.0,color: Palette.kWhite,height: 20.0),
                            SizedBox(height: 50.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/forgotPasswordScreen');
                                    },
                                    child: Text(
                                      "Forgot password?",
                                      style: kButtonTextStyle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/registerScreen1');
                                    },
                                    child: Text(
                                      "Register",
                                      style: kButtonTextStyle,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
