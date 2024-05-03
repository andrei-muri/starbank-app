import 'package:app_first_may/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), // display Lottie animation
          const SizedBox(
            height: Sizes.defaultSpace, // Use default space constant for spacing
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
          ), // Displaying the text
          const SizedBox(
            height: Sizes.defaultSpace, // Additional space after the text
          ),
          if (showAction) // Check if the action button should be shown
            SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(backgroundColor: Colors.black),
                child: Text(
                  actionText!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }

}
