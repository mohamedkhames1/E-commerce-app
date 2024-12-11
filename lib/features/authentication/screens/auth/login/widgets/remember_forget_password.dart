import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/features/authentication/screens/auth/login/forget_password.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class RememberAndForgetPassword extends StatelessWidget {
  const RememberAndForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: controller.rememberMe.value,
                onChanged: (value) => controller.rememberMe.value = value!,
              ),
            ),
            const Text(TTexts.rememberMe),
          ],
        ),
        TextButton(
          onPressed: () => Get.to(() => const ForgetPassword()),
          child: const Text(TTexts.forgetPassword),
        )
      ],
    );
  }
}
