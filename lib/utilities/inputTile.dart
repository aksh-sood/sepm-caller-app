import "package:flutter/material.dart";
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:flutter/services.dart';

//created by aksh
class InputTile extends StatelessWidget {
  InputTile(
      {this.isObscure = false,
      this.tileIcon,
      @required this.inputType,
      @required this.variable,
      this.textLength,
      this.tapCall,
      this.keyboard,
      this.setValidator,
      this.seeOnly = false,
      this.control});
  String variable;
  Function setValidator;
  Function tapCall;
  final String inputType;
  final bool isObscure;
  var control;
  bool seeOnly;
  final TextInputType keyboard;
  final IconButton tileIcon;
  final List<TextInputFormatter> textLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      inputFormatters: textLength,
      style: kTextFieldStyle,
      controller: control,
      readOnly: seeOnly,
      validator: setValidator,
      onChanged: (value) {
        variable = value;
      },
      onTap: tapCall,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Palette.kSecondaryColor,
        hintText: inputType,
        hintStyle: kHintTextStyle,
        suffixIcon: tileIcon,
        border: OutlineInputBorder(
            borderRadius: kTextFieldBorderRadius, borderSide: BorderSide.none),
      ),
    );
  }
}
