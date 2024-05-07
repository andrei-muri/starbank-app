import 'package:app_first_may/src/backend/authentication_repository/auth_repo.dart';
import 'package:app_first_may/src/backend/user/user_repo.dart';
import 'package:app_first_may/src/backend/user/usermodel.dart';
import 'package:app_first_may/src/constants/images.dart';
import 'package:app_first_may/src/utils/loader/fullscreen_loader.dart';
import 'package:app_first_may/src/utils/warnings/warnings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/network_connection/network_manager.dart';


class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController(); // Controller for email input
  final firstName = TextEditingController(); // Controller for first name input
  final lastName = TextEditingController(); // Controller for last name input
  final password = TextEditingController(); // Controller for password input
  final confirmPassword = TextEditingController(); // Controller for confirm password input
  GlobalKey<FormState> signupFormKey = GlobalKey<
      FormState>(); //Form key for form validation

  /// -- SIGNUp

  void signup(BuildContext context) async {
    try {
      // start loading
      FullScreenLoader.openLoadingDialog(
          "We are processing your information", Images.loaderGif, context);

      // check Internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        Warnings.warningSnackBar(title: "No Internet Connection");
        return;
      }
      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        Warnings.warningSnackBar(title: "Accept Privacy Policy",
            message: "In order to create account, you must have to read and accept the Privacy Policy & Terms of use");
        return;
      }

      //Register user in the Firebase Authentication & save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        email: email.text.trim(),);

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Show Succes Message
      Warnings.successBar(title: "Congratulations", message: 'Your account has been created.');
      // Move to verify Email Screen


    } catch (e) {
      Warnings.errorSnackBar(title: "Oh snap", message: e.toString());
      print(e);
    } finally {
      FullScreenLoader.stopdLoading();
    }
  }
}