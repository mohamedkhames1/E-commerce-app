import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/repositories_authenticatio.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model/user_model.dart';
import 'package:t_store/features/authentication/screens/auth/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstName = TextEditingController();
  final lasttName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

  bool heidePassword = true;
  final privacyPolicy = true.obs;
  void heidePasswordChange() {
    heidePassword = !heidePassword;
    update();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  void signup() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'We are Processing your information', TImages.docerAnimation);

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      if (!formState.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      if (!privacyPolicy.value) {
        FullScreenLoader.stopLoadingDialog();
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create Account you must have to read and accept Privacy Policy & Terms of use');
        return;
      }

      final userCredential = await AuthenticationRepoditry.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lasttName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phone.text.trim(),
          picture: '');

      final userRepository = Get.put(UserRepository());
      userRepository.saveUserRecords(newUser);

      FullScreenLoader.stopLoadingDialog();
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message:
              'Your Account has been created successfully, verifyemail to continue with');
      Get.to(() => VerifyEmail(
            email: email.text.trim(),
          ));
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
