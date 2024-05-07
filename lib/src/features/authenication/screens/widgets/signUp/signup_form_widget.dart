import 'package:app_first_may/src/constants/sizes.dart';
import 'package:app_first_may/src/constants/texts.dart';
import 'package:app_first_may/src/features/authenication/controllers/signup_controller.dart';
import 'package:app_first_may/src/features/authenication/screens/widgets/signUp/terms_and_conds.dart';
import 'package:app_first_may/src/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FormSignUpWidget extends StatelessWidget {
  const FormSignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              ///First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      Validator.validateEmptyText('First name', value),
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
                  controller: controller.lastName,
                  validator: (value) =>
                      Validator.validateEmptyText('Last name', value),
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
            controller: controller.email,
            validator: (value) => Validator.validateEmail(value),
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
          Obx(// observable
              () => TextFormField(
                  controller: controller.password,
                  validator: (value) => Validator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  expands: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: Texts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                    ),
                  ))),
          const SizedBox(
            height: Sizes.spaceBtwInputFields,
          ),

          ///confirm password
          Obx(
            () => TextFormField(
              controller: controller.confirmPassword,
              validator: (value) => Validator.validateConfirmPassword(controller.password.text,value),
              obscureText: controller.hideConfirmPassword.value,
              expands: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: Texts.confirmPassword,
                  prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(controller.hideConfirmPassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                  onPressed: () => controller.hideConfirmPassword.value =
                  !controller.hideConfirmPassword.value,
                ),
              ),
            ),
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
                onPressed: () => controller.signup(context),
                child: const Text("Create Account")),
          ),
        ],
      ),
    );
  }
}
