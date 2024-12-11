import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/authentication/screens/auth/signup/signup_screen.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class SigninAndCreateButtons extends StatelessWidget {
  const SigninAndCreateButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cotroller = Get.put(LoginController());
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => cotroller.login(),
            child: const Text(TTexts.signIn),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              Get.to(() => const SignUpScreen());
            },
            child: const Text(TTexts.createAccount),
          ),
        ),
      ],
    );
  }
}
