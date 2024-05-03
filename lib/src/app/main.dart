import 'package:app_first_may/src/constants/colors.dart';
import 'package:app_first_may/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../backend/firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized successfully");
  } catch (e) {
    print("Firebase initialization failed: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: getButtonTheme(),
      ),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }

  ElevatedButtonThemeData getButtonTheme() {
    return ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CustomColors.buttonYellow),
          foregroundColor: MaterialStateProperty.all(CustomColors.buttonYellowText),
          elevation: MaterialStateProperty.all(4.0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
        ),
      );
  }
}


