import 'package:app_first_may/src/constants/colors.dart';
import 'package:app_first_may/src/features/authenication/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormFieldInputDecoration {

  static InputDecoration lilaInputDecoration(bool isFocus, IconData prefixIcon, String label, bool isPassword) {
    LoginController controller = Get.find();
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
          suffixIcon: isPassword 
            ? IconButton(
              onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
              icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye, color: CustomColors.backgroundColor), 
            ) 
            : null,
    );
  }

  static BoxDecoration lilaShadowDecoration() {
    return  BoxDecoration(
              boxShadow: const [ BoxShadow(
              color: CustomColors.shadowColor,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(1.5, 2))
        ],
        borderRadius: BorderRadius.circular(15.0),
      )
    ;
  }
}