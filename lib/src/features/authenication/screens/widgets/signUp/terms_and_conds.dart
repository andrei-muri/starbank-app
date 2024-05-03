import 'package:app_first_may/src/constants/sizes.dart';
import 'package:app_first_may/src/constants/texts.dart';
import 'package:flutter/material.dart';

class TermsAndCondsWidget extends StatelessWidget {
  const TermsAndCondsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
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
