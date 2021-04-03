import 'package:flutter/material.dart';

//Colors
const kPrimaryColor = Color(0xFF0D47A1);
const kSecondaryColor = Color(0xFF2196F3);
const kContentColorDarkThemeColor = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFFFFFF4);
const kErrorColor = Color(0xFFF03738);
const kBlack = Color(0xDD000000);
const kGrey = Color(0xFF9E9E9E);
//Padding
const kDefaultPadding = 20.0;
const kDefaultButtonPadding = 8.0;
const kDefaultBorderRadius=20.0;
//decoration
const kInputPhoneDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText:"Enter Phone/Email",
    hintStyle: TextStyle(
      color: kGrey,
    ),
    border:OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: BorderSide.none
    )
);

//Text Style
const kMessageTextStyle = TextStyle(
  fontSize: 58.0,
  color: kPrimaryColor
);

const kButtonTextStyle = TextStyle(
  fontSize: 18.0,
);

