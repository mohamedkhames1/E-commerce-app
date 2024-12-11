import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/auth/success_screen.dart';
import 'package:t_store/data/repositories/authentication/repositories_authenticatio.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerification();
    setTimerforAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepoditry.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent ',
          message: 'Please Check your Inbox and verify your email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }

  setTimerforAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
              image: TImages.successfullyRegisterAnimation,
              title: TTexts.yourAccountCreatedTitle,
              subTitle: TTexts.yourAccountCreatedSubTitle,
              press: () => AuthenticationRepoditry.instance.screenRedrict()),
        );
      }
    });
  }

  checkEmailVerification() async {
    final curentUser = FirebaseAuth.instance.currentUser;
    if (curentUser != null && curentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
            image: TImages.successfullyRegisterAnimation,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            press: () => AuthenticationRepoditry.instance.screenRedrict()),
      );
    }
  }
}
