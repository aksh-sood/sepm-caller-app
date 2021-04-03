import 'package:flutter/material.dart';
import 'package:to_doc/utilities/pallete.dart';
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
      color: Palette.kGrey,
    ),
    border:OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        borderSide: BorderSide.none
    )
);

//Text Style
const kMessageTextStyle = TextStyle(
  fontSize: 58.0,
  color: Palette.kPrimaryColor
);

const kButtonTextStyle = TextStyle(
  fontSize: 18.0,
);

