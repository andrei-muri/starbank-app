import 'package:app_first_may/src/common/styles/form_field_style.dart';
import 'package:app_first_may/src/constants/colors.dart';
import 'package:app_first_may/src/constants/sizes.dart';
import 'package:app_first_may/src/features/authenication/controllers/login_controller.dart';
import 'package:app_first_may/src/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  bool _isEmailFocused = false;
  bool _isPasswordFocused = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(_handleEmailFocusChange);
    _passwordFocusNode.addListener(_handlePasswordFocusChange);
  }

  void _handleEmailFocusChange() {
    if (_emailFocusNode.hasFocus != _isEmailFocused) {
      setState(() {
        _isEmailFocused = _emailFocusNode.hasFocus;
      });
    }
  }

  void _handlePasswordFocusChange() {
    if (_passwordFocusNode.hasFocus != _isPasswordFocused) {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    }
  }

  @override
  void dispose() {
    _emailFocusNode.removeListener(_handleEmailFocusChange);
    _emailFocusNode.dispose();
    _passwordFocusNode.removeListener(_handlePasswordFocusChange);
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.spaceBtwSections),
        child: Column(
          children: [
            ///E-mail
            Container(
              decoration: FormFieldInputDecoration.lilaShadowDecoration(),
              child: TextFormField(
                controller: controller.email,
                focusNode: _emailFocusNode,
                validator: (value) => Validator.validateEmail(value),
                decoration: FormFieldInputDecoration.lilaInputDecoration(_isEmailFocused, Iconsax.direct_right, 'E-mail', false),
              ),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields),

            ///Password
            Obx(
              () => Container(
                  decoration: FormFieldInputDecoration.lilaShadowDecoration(),
                  child: TextFormField(
                    controller: controller.password,
                    focusNode: _passwordFocusNode,
                    validator: (value) => Validator.validateEmptyText('Password' ,value),
                    obscureText: controller.hidePassword.value,
                    decoration: FormFieldInputDecoration.lilaInputDecoration(_isPasswordFocused, Iconsax.password_check, 'Password', true),
                  )),
            ),
            const SizedBox(height: Sizes.spaceBtwInputFields / 2),

            ///Remember me
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx (() => Checkbox(
                      value: controller.rememberMe.value, 
                      onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value, 
                      activeColor: CustomColors.buttonYellow,)),
                    const Text('Remember me',
                        style: TextStyle(color: Colors.white))
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password',
                        style: TextStyle(color: Color(0xffaba5e5)))),
              ],
            ),
            const SizedBox(height: Sizes.spaceBtwSections),

            ///Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 165,
                    height: 55,
                    ///A elevatedButton theme is created
                    child: ElevatedButton( onPressed: () => controller.emailAndPasswordSignIn(context), child: const Text('Sign In'))),
                const SizedBox(height: Sizes.spaceBtwItems),
                SizedBox(
                    width: 165,
                    height: 55,
                    child: ElevatedButton( onPressed: () {}, child: const Text('Create account'))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
