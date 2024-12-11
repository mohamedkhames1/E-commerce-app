import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/sign_controller/sign_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class IAgree extends StatelessWidget {
  const IAgree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController.instance;
    final dart = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value) => controller.privacyPolicy.value = value!,
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "${TTexts.iAgreeTo} ",
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: "${TTexts.privacyPolicy} ",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dart ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dart ? TColors.white : TColors.primary,
                      )),
              TextSpan(
                  text: "${TTexts.and} ",
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: "${TTexts.termsOfUse} ",
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dart ? TColors.white : TColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dart ? TColors.white : TColors.primary,
                      )),
            ],
          ),
        ),
      ],
    );
  }
}
