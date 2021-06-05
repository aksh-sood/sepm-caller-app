import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/inputTile.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:to_doc_patient/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_doc_patient/utilities/dropDownList.dart';

//created by aksh
class RegisterSpecialization extends StatefulWidget {
  @override
  _RegisterSpecializationState createState() => _RegisterSpecializationState();
}

class _RegisterSpecializationState extends State<RegisterSpecialization> {
  String qualification = "";
  String imrNumber = "";
  String specialization;
  String medCouncil;
  String registerYear = "";
  bool correctCouncil = false;
  DateTime selectedDate = DateTime.now();

  void validate() {
    if (formkey.currentState.validate() && correctCouncil) {
      print("validated");
      Navigator.pushNamed(context, '/registerScreen3');
    } else if (!correctCouncil) {
      Fluttertoast.showToast(
          msg: "Please choose a medical Council",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Palette.kContentColorDarkThemeColor,
          textColor: Palette.kWhite,
          fontSize: 16.0);
    } else {
      print("not validated");
      Fluttertoast.showToast(
          msg: "Please check the required fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Palette.kContentColorDarkThemeColor,
          textColor: Palette.kWhite,
          fontSize: 16.0);
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

  /// This builds material date picker in Android
  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.year,
      helpText: "Enter Registration Date",
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(selectedDate.year.toInt() + 1),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  /// This builds cupertion date picker in iOS
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: (selectedDate.year.toInt() + 1),
            ),
          );
        });
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
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 20),
                        InputTile(
                            setValidator: (value) {
                              if (value.isEmpty) {
                                return "Required";
                              } else {
                                return null;
                              }
                            },
                            isObscure: false,
                            inputType: "Enter Qualification",
                            variable: qualification),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Palette.kSecondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              hint: Text(
                                'Pick a Specialization',
                                style: kHintTextStyle,
                              ),
                              value: specialization,
                              icon: const Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              iconSize: 24,
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              elevation: 16,
                              style: kHintTextStyle,
                              dropdownColor: Palette.kSecondaryColor,
                              onChanged: (String newValue) {
                                setState(() {
                                  specialization = newValue;
                                });
                              },
                              items: specializations
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                            onTap: () => _selectDate(context),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Palette.kSecondaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(7, 15, 7, 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${selectedDate.toLocal()}"
                                              .split('-')[2]
                                              .split(" ")[0] +
                                          "/" +
                                          "${selectedDate.toLocal()}"
                                              .split('-')[1] +
                                          "/" +
                                          "${selectedDate.toLocal()}"
                                              .split('-')[0],
                                      style: kHintTextStyle,
                                    ),
                                    Icon(Icons.calendar_today_rounded,
                                        color: Palette.kWhite),
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(height: 20.0),
                        InputTile(
                            setValidator: (value) {
                              if (value.isEmpty) {
                                return "Required";
                              } else {
                                return null;
                              }
                            },
                            inputType: "Enter IMR Number",
                            variable: imrNumber),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Palette.kSecondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(7, 15, 7, 15),
                            child: DropdownButton(
                              isExpanded: true,
                              style: kHintTextStyle,
                              underline: Container(
                                color: Colors.transparent,
                              ),
                              hint: Text(
                                'Pick a Medical Council',
                                style: kHintTextStyle,
                              ),
                              dropdownColor: Palette.kSecondaryColor,
                              icon: Icon(
                                Icons.arrow_drop_down_circle_outlined,
                                color: Colors.white,
                              ),
                              items: medCouncils.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              value: medCouncil,
                              onChanged: (value) {
                                setState(() {
                                  medCouncil = value;
                                  if (!(medCouncil == null)) {
                                    correctCouncil = true;
                                  }
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
                                  padding:
                                      EdgeInsets.all(kDefaultButtonPadding),

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
                                  // validate();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
