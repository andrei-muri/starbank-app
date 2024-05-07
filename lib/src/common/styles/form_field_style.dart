import 'package:app_first_may/src/constants/colors.dart';
import 'package:app_first_may/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormFieldInputDecoration {

  static InputDecoration lilaInputDecoration(bool isFocus, IconData prefixIcon, IconData? suffixIcon, String label) {
     return InputDecoration(
      border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide:
                  const BorderSide(color: CustomColors.inputFieldsBorderColor, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: CustomColors.inputFieldsBorderColor,
                width: 1.0,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide:
                  const BorderSide(color: CustomColors.inputFieldsBorderFocusedColor, width: 1.0)),
          filled: true,
          fillColor:
              isFocus ? CustomColors.inputFieldsFillFocusedColor  : CustomColors.inputFieldsFillColor,
          prefixIcon: Icon(prefixIcon, color: const Color.fromARGB(118, 36, 33, 67)),
          hintText: label,
          hintStyle: TextStyle(
              color: isFocus
                  ? CustomColors.inputFieldsTextFocusedColor
                  : CustomColors.inputFieldsTextColor),
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: CustomColors.backgroundColor)
              : null,
    );
  }
}