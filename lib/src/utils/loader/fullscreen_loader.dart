import 'package:app_first_may/src/common/widgets/loader/animation_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullScreenLoader {
  /// open a full-screen loading dialog with a given text and animation

  static void openLoadingDialog(String textDisplayed, String animation,BuildContext context) {
    showDialog(
        context: context, // Use Get.OVerlayContext for overlay dialogs
        barrierDismissible: false, // the dialog can't be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, // disable popping with the back button
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: double.infinity,
              child:  Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  AnimationLoaderWidget(text: textDisplayed, animation: animation),
                ],
              ),
            )
        ));
  }

  static void stopdLoading() {
    Navigator.of(Get.overlayContext!)
        .pop(); // close the dialog using the navigator
  }
}
