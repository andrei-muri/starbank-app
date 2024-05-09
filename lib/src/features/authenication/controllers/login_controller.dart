
import 'package:app_first_may/src/backend/authentication_repository/auth_repo.dart';
import 'package:app_first_may/src/constants/images.dart';
import 'package:app_first_may/src/utils/loader/fullscreen_loader.dart';
import 'package:app_first_may/src/utils/network_connection/network_manager.dart';
import 'package:app_first_may/src/utils/warnings/warnings.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  ///E-mail and password variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> emailAndPasswordSignIn(BuildContext context) async {
    try {
      //start loading
      FullScreenLoader.openLoadingDialog('Logging you in...', Images.loaderGif, context);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        FullScreenLoader.stopdLoading();
        return;
      }

      //Form validation
      if(!loginFormKey.currentState!.validate()) {
        FullScreenLoader.stopdLoading();
        return;
      }

      //Save Data if remember me is selected
      if(rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & passwod auth
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      FullScreenLoader.stopdLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      FullScreenLoader.stopdLoading();
      Warnings.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }


}