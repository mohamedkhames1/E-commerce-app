import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../common/loaders/animation_loader.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
          canPop: false,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.dark
                : TColors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                //animation
                TAnimationLoader(animation: animation, text: text)
              ],
            ),
          )),
    );
  }

  static void stopLoadingDialog() {
    Navigator.pop(Get.overlayContext!);
  }
}
