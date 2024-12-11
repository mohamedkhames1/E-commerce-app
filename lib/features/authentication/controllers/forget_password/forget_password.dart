import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/repositories_authenticatio.dart';
import 'package:t_store/features/authentication/screens/auth/login/widgets/reset_password.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  final email = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  sendPasswordResetEmail() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing Your Request...', TImages.docerAnimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoadingDialog();
        TLoaders.errorSnackBar(
            title: 'Oops', message: 'No Internet Connection');
        return;
      }

      if (!formState.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }
      await AuthenticationRepoditry.instance
          .sendPasswordResetEmail(email.text.trim());
      FullScreenLoader.stopLoadingDialog();

      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link sent to Reset your Password');
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }

  reSendPasswordResetEmail(String email) async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing Your Request...', TImages.docerAnimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoadingDialog();
        TLoaders.errorSnackBar(
            title: 'Oops', message: 'No Internet Connection');
        return;
      }

      await AuthenticationRepoditry.instance.sendPasswordResetEmail(email);

      FullScreenLoader.stopLoadingDialog();

      TLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link sent to Reset your Password');
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
