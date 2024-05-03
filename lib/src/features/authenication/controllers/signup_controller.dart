
import 'package:app_first_may/src/constants/images.dart';
import 'package:app_first_may/src/utils/loader/fullscreen_loader.dart';
import 'package:app_first_may/src/utils/loader/warnings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/network_connection/network_manager.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final email = TextEditingController(); // Controller for email input
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final password = TextEditingController(); // Controller for password input
  final confirmPassword = TextEditingController(); // Controller for confirm password input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //Form key for form validation

  /// -- SIGNUp

  Future<void> signup(BuildContext context) async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          "We are processing your information", Images.loaderGif,context);

     // check Internet connection
     final isConnected = await NetworkManager.instance.isConnected();
     if(!isConnected){
       Warnings.warningSnackBar(title: "No Internet Connection");
       return;
     }
      // Form Validation
      if(!signupFormKey.currentState!.validate()){
        return;
      }

      // Privacy Policy Check

      //Register user in the Firebase Authentication & save user data in the Firebase

      // Save Authenticated user data in the Firebase Firestore

      // Show Succes Message

      // Move to verify Email Screen
    } catch (e) {
        Warnings.errorSnackBar(title: "Oh snap", message: e.toString());
    } finally {
        FullScreenLoader.stopdLoading();
    }
  }
}