import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repositories/authentication/repositories_authenticatio.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/models/user_model/user_model.dart';
import 'package:t_store/features/authentication/screens/auth/login/login.dart';
import 'package:t_store/features/personalization/screens/profile/widget/re_authentication_user_login_form.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final headinPassword = true.obs;
  final Rx<UserModel> user = UserModel.empty().obs;
  final imageUploadig = false.obs;
  final profileloding = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecorded();
  }

  Future<void> fetchUserRecorded() async {
    try {
      profileloding.value = true;
      final user = await userRepository.fatchUserDetails();
      this.user.value = user;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileloding.value = false;
    }
  }

  Future<void> saveUserRecorded(UserCredential? userCredential) async {
    try {
      await fetchUserRecorded();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final namePart =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName =
              UserModel.generatusername(userCredential.user!.displayName ?? '');

          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: namePart[0],
              lastName:
                  namePart.length > 1 ? namePart.sublist(1).join(' ') : '',
              userName: userName,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              picture: userCredential.user!.photoURL ?? '');
          userRepository.saveUserRecords(user);
        }
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Data not saved',
          message:
              'Somthing went wrong while saving your information , you can re-save your data in your profile');
    }
  }

  void deleteAccountWaringPopos() {
    Get.defaultDialog(
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account Parameters ? this actio is not reversible and all of your data will be removed paramently',
      contentPadding: const EdgeInsets.all(TSizes.md),
      confirm: ElevatedButton(
        onPressed: () => deleteUserAcount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: ElevatedButton(
          onPressed: () => Navigator.pop(Get.overlayContext!),
          child: const Text('Cancel')),
    );
  }

  void deleteUserAcount() async {
    try {
      FullScreenLoader.openLoadingDialog('Prosessing', TImages.docerAnimation);
      final auth = AuthenticationRepoditry.instance;
      final provider = auth.user!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.loginWithGoogle();
          await auth.deleteAccoun();
          FullScreenLoader.stopLoadingDialog();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoadingDialog();
          await Get.to(() => const ReAuthenLoginForm());
        }
      }
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackBar(title: "Oops!", message: e.toString());
    }
  }

  Future<void> reAuthenticationEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingDialog('Prosessing', TImages.docerAnimation);
      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }
      if (!formstate.currentState!.validate()) {
        FullScreenLoader.stopLoadingDialog();
        return;
      }

      await AuthenticationRepoditry.instance.reAuthenticatioEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepoditry.instance.deleteAccoun();
      FullScreenLoader.stopLoadingDialog();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      FullScreenLoader.stopLoadingDialog();
      TLoaders.errorSnackBar(title: "Oops!", message: e.toString());
    }
  }

  Future<void> uploadProfileImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageUploadig.value = true;
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);
        Map<String, dynamic> json = {'Picture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.picture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image was successfully uploaded');
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oops!", message: e.toString());
    } finally {
      imageUploadig.value = false;
    }
  }
}
