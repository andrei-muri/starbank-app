import 'package:app_first_may/src/common/widgets/authentication/divider_widget.dart';
import 'package:app_first_may/src/common/widgets/authentication/footer_google_facebook_widget.dart';
import 'package:app_first_may/src/constants/sizes.dart';
import 'package:app_first_may/src/constants/texts.dart';
import 'package:app_first_may/src/features/authenication/screens/widgets/signUp/signup_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(Sizes.defaultSpace),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                Texts.signUpTitle,
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: Sizes.spaceBtwSections,
              ),

              ///Form
              FormSignUpWidget(),
              SizedBox(
                height: Sizes.spaceBtwSections,
              ),

              ///sign up with google/facebook
              DividerWidget(),
              FooterGoogleFacebookWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
