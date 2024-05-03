import 'package:app_first_may/src/constants/sizes.dart';
import 'package:app_first_may/src/constants/texts.dart';
import 'package:app_first_may/src/features/authenication/screens/widgets/signUp/terms_and_conds.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class FormSignUpWidget extends StatelessWidget {
  const FormSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              ///First Name
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

              ///Last name
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
            height: Sizes.spaceBtwInputFields,
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
          const TermsAndCondsWidget(),
          const SizedBox(
            height: Sizes.spaceBtwSections,
          ),

          ///Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {}, child: const Text("Create Account")),
          ),
        ],
      ),
    );
  }
}
