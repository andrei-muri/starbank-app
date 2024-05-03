import 'package:app_first_may/src/common/widgets/authentication/form_field_widget.dart';
import 'package:app_first_may/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwSections),
        child: Column(
          children: [
            //Email
            const FormFieldWidget(prefixIcon: Iconsax.direct_right, label: 'E-mail',
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields),

            //Password
            const FormFieldWidget(prefixIcon: Iconsax.password_check, label: 'Password', suffixIcon: Iconsax.eye_slash),
            const SizedBox(height: Sizes.spaceBtwInputFields / 2),

            //Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Checkbox(
                      value: true, 
                      onChanged: (value) {},
                      activeColor: const Color(0xff5A5494),),
                    const Text('Remember me', style: TextStyle(color: Colors.white))
                  ],
                ),

                //Forgot Password
                TextButton(
                    onPressed: () {}, child: const Text('Forgot Password',
                        style: TextStyle(color: Color(0xffaba5e5)))),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            ///Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Sign In Button
                SizedBox(
                    width: 165,
                    height: 55,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign In'))),
                const SizedBox(height: Sizes.spaceBtwItems),

                //Create Account Button
                SizedBox(
                    width: 165,
                    height: 55,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Create account'))),
              ],)
            
          ],
        ),
      ),
    );
  }
}


