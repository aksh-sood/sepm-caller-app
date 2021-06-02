import "package:flutter/material.dart";
import 'package:to_doc_patient/utilities/constants.dart';
import 'package:to_doc_patient/utilities/pallete.dart';
import 'package:flutter/services.dart';

//created by aksh
class InputTile extends StatelessWidget {
  InputTile(
      {@required this.isObscure,
      this.tileIcon,
      @required this.inputType,
      @required this.variable,
      this.textLength,
      this.keyboard,
      this.setValidator});
  String variable;
  Function setValidator;
  final String inputType;
  final bool isObscure;
  final TextInputType keyboard;
  final IconButton tileIcon;
  final List<TextInputFormatter> textLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      inputFormatters: textLength,
      style: kTextFieldStyle,
      validator: setValidator,
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
            borderRadius: kTextFieldBorderRadius, borderSide: BorderSide.none),
      ),
    );
  }
}
