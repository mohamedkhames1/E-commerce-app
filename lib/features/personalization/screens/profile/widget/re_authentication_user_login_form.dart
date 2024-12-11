import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/features/personalization/controller/user/user_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class ReAuthenLoginForm extends StatelessWidget {
  const ReAuthenLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Re-Authentication User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
            key: controller.formstate,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPassword,
                    obscureText: controller.headinPassword.value,
                    validator: (value) =>
                        TValidator.validateEmptyTexy('Password', value),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.headinPassword.value =
                              !controller.headinPassword.value,
                          icon: Icon(controller.headinPassword.value
                              ? Iconsax.eye
                              : Iconsax.eye_slash),
                        ),
                        labelText: TTexts.password),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticationEmailAndPasswordUser(),
                        child: const Text('Re-Authentication User'))),
              ],
            )),
      ),
    );
  }
}
