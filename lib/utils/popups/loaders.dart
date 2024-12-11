import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';

class TLoaders {
  static void warningSnackBar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.orange,
      duration: const Duration(seconds: 3),
      colorText: TColors.white,
      isDismissible: true,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void successSnackBar(
      {required String title, String message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: TColors.primary,
      duration: Duration(seconds: duration),
      colorText: TColors.white,
      isDismissible: true,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: TColors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void errorSnackBar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red.shade600,
      duration: const Duration(seconds: 3),
      colorText: TColors.white,
      isDismissible: true,
      shouldIconPulse: true,
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
