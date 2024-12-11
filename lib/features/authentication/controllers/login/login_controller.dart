import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication/repositories_authenticatio.dart';
import 'package:t_store/features/personalization/controller/user/user_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final rememberMe = true.obs;
  final headinPassword = true.obs;
  final localStorage = GetStorage();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('RememberMe_Email') ?? '';
    password.text = localStorage.read('RememberMe_password') ?? '';
  }

  void login() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Logging you in .....', TImages.docerAnimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }
      if (!formState.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }
      if (rememberMe.value) {
        localStorage.write('RememberMe_Email', email.text.trim());

        localStorage.write('RememberMe_password', password.text.trim());
      }
      await AuthenticationRepoditry.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      AuthenticationRepoditry.instance.screenRedrict();
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }

  void googleSignin() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Logging you in .....', TImages.docerAnimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      final userCredential =
          await AuthenticationRepoditry.instance.loginWithGoogle();

      userController.saveUserRecorded(userCredential);

      FullScreenLoader.stopLoadingDialog();

      AuthenticationRepoditry.instance.screenRedrict();
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
