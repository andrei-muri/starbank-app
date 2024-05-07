import 'package:app_first_may/src/common/styles/spacing_styles.dart';
import 'package:app_first_may/src/common/widgets/authentication/divider_widget.dart';
import 'package:app_first_may/src/common/widgets/authentication/footer_google_facebook_widget.dart';
import 'package:app_first_may/src/features/authenication/screens/widgets/login/login_form_widget.dart';
import 'package:app_first_may/src/features/authenication/screens/widgets/login/login_header_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return const Scaffold(
        backgroundColor: Color(0xff242143),
        body: SingleChildScrollView(
            child: Padding(
                padding: SpacingStyle.paddingWithApBarHeight,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      //Logo and text
                      LoginHeaderWidget(),

                      //Form
                      LoginFormWidget(),

                      ///Divider
                      DividerWidget(),

                      ///Footer
                      FooterGoogleFacebookWidget()
                    ],
                  ),
                ))));
  }
}
