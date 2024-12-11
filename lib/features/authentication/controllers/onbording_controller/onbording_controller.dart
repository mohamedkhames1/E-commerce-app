import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/onbording/onbording_data.dart';
import 'package:t_store/features/authentication/screens/auth/login/login.dart';

class OnbordingController extends GetxController {
  int currentIndex = 0;
  PageController pageController = PageController();
  final storage = GetStorage();

  void onPageChanged(int index) {
    currentIndex = index;
    update();
  }

  void skipButton() {
    Get.offAll(() => const LoginScreen());
    storage.write('isFirstTime', false);
    update();
  }

  void nextPage() {
    if (currentIndex < onbordingData.length - 1) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      storage.write('isFirstTime', false);
      Get.offAll(() => const LoginScreen());
    }
  }
}
