import "package:flutter/material.dart";
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:flutter/services.dart';

//created by aksh
class InputTile extends StatelessWidget {
  InputTile({
    @required this.isObscure,
    this.tileIcon,
    @required this.inputType,
    @required this.variable,
    this.textLength,
  });
  String variable;
  final String inputType;
  final bool isObscure;
  final IconButton tileIcon;
  final List<TextInputFormatter> textLength;
  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: textLength,
      style: kTextFieldStyle,
      onChanged: (value) {
        variable = value;
      },
      obscureText: isObscure,
      decoration: InputDecoration(
          filled: true,
          fillColor: Palette.kSecondaryColor,
          hintText: inputType,
          hintStyle: kHintTextStyle,
          suffixIcon: tileIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide.none)),
    );
  }
}
