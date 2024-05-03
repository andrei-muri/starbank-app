import 'package:app_first_may/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
            child: Divider(
          color: Colors.grey,
          thickness: 0.5,
          indent: 60,
          endIndent: 5,
        )),
        Text('Or Sign In With',
            style: TextStyle(
                fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w200)),
        Flexible(
            child: Divider(
          color: Colors.grey,
          thickness: 0.5,
          indent: 5,
          endIndent: 60,
        )),
      ]),
      SizedBox(height: Sizes.spaceBtwSections)
    ]);
  }
}
