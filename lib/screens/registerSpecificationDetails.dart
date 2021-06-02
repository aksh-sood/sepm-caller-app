import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/inputTile.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';
import 'package:to_doc_patient/utilities/councils.dart';

//created by aksh
class RegisterSpecialization extends StatefulWidget {
  @override
  _RegisterSpecializationState createState() => _RegisterSpecializationState();
}

class _RegisterSpecializationState extends State<RegisterSpecialization> {
  String qualification = "";
  String imrNumber = "";
  String specialization = "";
  String medCouncil;
  String registerYear = "";
  DateTime date;
  List<DropdownMenuItem<String>> _medicalCouncils;
  selectDate() async {
    DateTime datePicker = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1945),
      lastDate: DateTime(DateTime.now().year),
    );
    if (datePicker != null) {
      setState(() {
        date = datePicker;
        print(date.toString());
        registerYear = date.toString();
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _medicalCouncils = buildDropDownMenuItems(medCouncils);
    medCouncil = _medicalCouncils[0].value;
    date = DateTime.now();
  }

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List medCouncils) {
    List<DropdownMenuItem<String>> items = [];
    for (String council in medCouncils) {
      items.add(
        DropdownMenuItem(
          value: council,
          child: Text(council),
        ),
      );
    }
    return items;
  }

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
                      SizedBox(height: 20),
                      InputTile(
                          isObscure: false,
                          inputType: "Enter Qualification",
                          variable: qualification),
                      SizedBox(height: 20.0),
                      InputTile(
                          isObscure: false,
                          inputType: "Enter Specialization ",
                          variable: specialization),
                      SizedBox(height: 20.0),
                      // ListTile(
                      //     trailing: Icon(Icons.calendar_today_rounded),
                      //     onTap: selectDate(),
                      //     title: Text(
                      //         "Registeration Date: ${date.day}/${date.month}/${date.year}")),
                      //TODO:Fix the calender
                      Text("Register date"),
                      SizedBox(height: 20.0),
                      InputTile(
                          isObscure: false,
                          inputType: "Enter IMR Number",
                          variable: imrNumber),
                      SizedBox(height: 20.0),
                      //TODO:fix dimensions of container

                      Container(
                        // height:
                        decoration: BoxDecoration(
                          color: Palette.kSecondaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            style: kHintTextStyle,
                            dropdownColor: Palette.kSecondaryColor,
                            icon: Icon(Icons.arrow_drop_down_circle_outlined),
                            items: _medicalCouncils,
                            value: medCouncil,
                            onChanged: (value) {
                              setState(() {
                                medCouncil = value;
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Text(
                                "Enter",
                                style: kButtonLightTextStyle,
                              ),
                              style: ElevatedButton.styleFrom(
                                //primary: Palette.kSecondaryColor,
                                padding: EdgeInsets.all(kDefaultButtonPadding),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      kDefaultBorderRadius),
                                ),
                              ),
                              onPressed: () async {
                                // var msg;
                                // User user = User.a(
                                //     phone: phone,
                                //     email: email,
                                //     password: password,
                                //     city: city
                                //     );
                                // var response = await user.registerUser();
                                // if (response['success'] == 'no') {
                                //   msg = response['error'];
                                // } else {
                                //   msg = response['message'];
                                //   Navigator.pop(context);
                                // }
                                // Fluttertoast.cancel();
                                // Fluttertoast.showToast(
                                //     msg: "$msg",
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.BOTTOM,
                                //     timeInSecForIosWeb: 1,
                                //     backgroundColor:
                                //         Palette.kContentColorDarkThemeColor,
                                //     textColor: Palette.kWhite,
                                //     fontSize: 16.0);
                                Navigator.pushNamed(
                                    context, '/registerScreen3');
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
          ],
        ),
      ),
    );
  }
}