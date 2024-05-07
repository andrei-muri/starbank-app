import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();


  ///variables
  final deviceStorage = GetStorage;
  final _auth = FirebaseAuth.instance;


  /// Called from main.dart on app launch
  @override
  void onReady(){
    //Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropiate screen
    screenRedirect();

  }

  ///Function to Show relevant Screen
  screenRedirect() async{
    // //Local Storage
    // deviceStorage.writeIfNull('IsFirstTime', true);
    // // check if it's the first time launching the app
    // deviceStorage.read('IsFirstTime') != true
    //   ? Get.offAll(() => const LoginScreen()) // Redirect to Login Screen if no the first time
    //   : get.offAll(const onBoardingScreen()); // Redirect to OnBoarding Screen if it's the first time
  }


  /* ---------------------------------------------Email & Password Sign in ------------------------ */

  ///Registrer
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
      throw Exception('An error occurred during registration: ${e.message}');
    } catch (e) {
      // Optionally, handle unexpected errors more broadly
      throw Exception('Unexpected error during registration: $e');
    }
  }

}