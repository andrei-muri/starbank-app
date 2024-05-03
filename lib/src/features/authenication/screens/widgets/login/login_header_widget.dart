import 'package:app_first_may/src/constants/images.dart';
import 'package:app_first_may/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
