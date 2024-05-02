import 'package:app_first_may/src/constants/sizes.dart';
import 'package:app_first_may/src/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Title
                const Text(
                  Texts.signUpTitle,
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: Sizes.spaceBtwSections,
                ),

                ///Form
                Form(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              expands: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: Texts.firstName,
                                  prefixIcon: const Icon(Iconsax.user)),
                            ),
                          ),
                          const SizedBox(
                            width: Sizes.spaceBtwInputFields,
                          ),
                          Expanded(
                            child: TextFormField(
                              expands: false,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: Texts.lastName,
                                  prefixIcon: const Icon(Iconsax.user)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),

                      ///Email
                      TextFormField(
                        expands: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: Texts.email,
                            prefixIcon: const Icon(Iconsax.direct)),
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwInputFields,
                      ),
                      const SizedBox(
                        width: Sizes.spaceBtwInputFields,
                      ),

                      ///Password
                      TextFormField(
                        obscureText: true,
                        expands: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: Texts.password,
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: const Icon(Iconsax.eye_slash)),
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwSections,
                      ),

                    ///confirm password
                      TextFormField(
                        obscureText: true,
                        expands: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: Texts.confirmPassword,
                            prefixIcon: const Icon(Iconsax.password_check),
                            suffixIcon: const Icon(Iconsax.eye_slash)),
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwSections,
                      ),
                    ///Terms&conditions checkbox
                      Row(
                        children: [
                          SizedBox(width: 24, height: 24,child: Checkbox(value: true, onChanged: (value){},),),
                          const SizedBox(
                            width: Sizes.spaceBtwInputFields,
                          ),
                           Text.rich(TextSpan(
                            children: [
                              TextSpan(text: Texts.iAgreeTo, style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(text: Texts.privacyPolicy,style: Theme.of(context).textTheme.bodyMedium!.apply(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.blue
                              )),
                              TextSpan(text: Texts.and,style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(text: Texts.termsOfUse,style: Theme.of(context).textTheme.bodyMedium!.apply(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blue)),
                            ]
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: Sizes.spaceBtwSections,
                      ),

                      ///Sign Up Button
                      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Create Account")),)
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
