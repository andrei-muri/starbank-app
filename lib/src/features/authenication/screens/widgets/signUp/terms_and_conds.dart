import 'package:app_first_may/src/constants/sizes.dart';
import 'package:app_first_may/src/constants/texts.dart';
import 'package:app_first_may/src/features/authenication/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TermsAndCondsWidget extends StatelessWidget {
  const TermsAndCondsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(
          width: Sizes.spaceBtwInputFields,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: Texts.iAgreeTo,
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: Texts.privacyPolicy,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue)),
          TextSpan(
              text: Texts.and, style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: Texts.termsOfUse,
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue)),
        ]))
      ],
    );
  }
}
