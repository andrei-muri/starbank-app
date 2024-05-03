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
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right), labelText: 'E-mail'),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields),

            //Password
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: 'Password',
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields / 2),

            //Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text('Remember me')
                  ],
                ),

                //Forgot Password
                TextButton(
                    onPressed: () {}, child: const Text('Forgot Password')),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            //Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Sign In'))),
            const SizedBox(height: Sizes.spaceBtwItems),

            //Create Account Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Create account'))),
          ],
        ),
      ),
    );
  }
}
