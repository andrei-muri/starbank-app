import 'package:app_first_may/src/bindings/general_bidings.dart';
import 'package:app_first_may/src/features/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../backend/authentication_repository/auth_repo.dart';
import '../backend/firebase_options.dart';
void main() async{
  ///Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init(); //Getx local storage

  /// Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
    print("Firebase initialized successfully");
  } catch (e) {
    print("Firebase initialization failed: $e");
    // Optionally, you might want to set up error reporting or logging here.
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}


