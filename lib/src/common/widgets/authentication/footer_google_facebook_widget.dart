import 'package:app_first_may/src/constants/images.dart';
import 'package:app_first_may/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class FooterGoogleFacebookWidget extends StatelessWidget {
  const FooterGoogleFacebookWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: Sizes.iconMd,
                height: Sizes.iconMd,
                image: AssetImage(Images.googleImg),
              )),
        ),
        const SizedBox(width: Sizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                width: Sizes.iconMd,
                height: Sizes.iconMd,
                image: AssetImage(Images.facebookImg),
              )),
        ),
      ],
    );
  }
}
