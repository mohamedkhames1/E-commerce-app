import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controller/user/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UpdateNameCotroller extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'We are Updating your information...', TImages.docerAnimation);
      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      if (!formstate.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      final Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };

      await userRepository.updateSingleField(name);
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      FullScreenLoader.stopLoadingDialog();
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated');
      Get.off(() => const Profile());
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      TLoaders.successSnackBar(title: 'Oops!', message: e.toString());
    }
  }
}
