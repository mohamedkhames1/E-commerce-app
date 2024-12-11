import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class TextFormForLogin extends StatelessWidget {
  const TextFormForLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.formState,
        child: Column(
          children: [
            TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            Obx(
              () => TextFormField(
                validator: (value) =>
                    TValidator.validateEmptyTexy('Password', value),
                controller: controller.password,
                obscureText: controller.headinPassword.value,
                decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.headinPassword.value =
                        !controller.headinPassword.value,
                    icon: Icon(controller.headinPassword.value
                        ? Iconsax.eye
                        : Iconsax.eye_slash),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
