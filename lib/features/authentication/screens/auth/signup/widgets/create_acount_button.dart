import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/sign_controller/sign_controller.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class CreateAcountButton extends StatelessWidget {
  const CreateAcountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            controller.signup();
          },
          child: const Text(TTexts.createAccount)),
    );
  }
}
