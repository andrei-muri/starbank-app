import 'package:app_first_may/src/common/widgets/app_bar/custom_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.lightBlueAccent,
              height: 100,
              width: double.infinity,
              child: CustomAppBar(
                title:  Column(
                  children: [
                  ],
                ),
                actions: [
                  IconButton( icon: const Icon(Iconsax.menu_board), onPressed: () {},)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
