import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/sign_controller/sign_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/validators/validation.dart';

class CreateAcountForm extends StatelessWidget {
  const CreateAcountForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.formState,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyTexy('First Name', value),
                  controller: controller.firstName,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.defaultSpace,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyTexy('Last Name', value),
                  controller: controller.lasttName,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          TextFormField(
            validator: (value) =>
                TValidator.validateEmptyTexy('User Name', value),
            controller: controller.userName,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          TextFormField(
            validator: (value) => TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phone,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          GetBuilder<SignUpController>(builder: (controller) {
            return TextFormField(
              validator: (value) => TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.heidePassword,
              decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.heidePasswordChange(),
                  icon: Icon(controller.heidePassword
                      ? Iconsax.eye
                      : Iconsax.eye_slash),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
