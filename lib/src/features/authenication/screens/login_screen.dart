import 'package:app_first_may/src/common/styles/spacing_styles.dart';
import 'package:app_first_may/src/common/widgets/authentication/divider_widget.dart';
import 'package:app_first_may/src/common/widgets/authentication/footer_google_facebook_widget.dart';
import 'package:app_first_may/src/constants/images.dart';
import 'package:app_first_may/src/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff121212),
        body: SingleChildScrollView(
            child: Padding(
                padding: SpacingStyle.paddingWithApBarHeight,
                child: Center(
                  child: Column(
                    children: [
                      //Logo and text
                      Column(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: SvgPicture.asset(Images.steleiImg),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: Sizes.md),
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: Sizes.fontSizeLg,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),

                      //Form
                      Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: Sizes.spaceBtwSections),
                          child: Column(
                            children: [
                              //Email
                              TextFormField(
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.direct_right),
                                    labelText: 'E-mail'),
                              ),
                              const SizedBox(height: Sizes.spaceBtwInputFields),

                              //Password
                              TextFormField(
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Iconsax.password_check),
                                    labelText: 'Password',
                                    suffixIcon: Icon(Iconsax.eye_slash)),
                              ),
                              const SizedBox(
                                  height: Sizes.spaceBtwInputFields / 2),

                              //Remember Me & Forget Password
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  //Remember Me
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: true, onChanged: (value) {}),
                                      const Text('Remember me')
                                    ],
                                  ),

                                  //Forgot Password
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text('Forgot Password')),
                                ],
                              ),
                              const SizedBox(height: Sizes.spaceBtwSections),

                              //Sign In Button
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Sign In'))),
                              const SizedBox(height: Sizes.spaceBtwItems),

                              //Create Account Button
                              SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Create account'))),
                            ],
                          ),
                        ),
                      ),

                      ///Divider
                      const DividerWidget(),

                      ///Footer
                      const FooterGoogleFacebookWidget()
                    ],
                  ),
                ))));
  }
}


