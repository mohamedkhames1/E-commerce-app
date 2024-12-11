import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/sign_controller/verify_email_controller.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class VerifyEmailBody extends StatelessWidget {
  const VerifyEmailBody({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(TImages.deliveredEmailIllustration),
              width: THelperFunctions.screenWidth() * .6,
            ),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            Text(
              TTexts.confirmEmail,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              email ?? '',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Text(
              TTexts.confirmEmailSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerification(),
                  child: const Text(TTexts.tContinue)),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(TTexts.resendEmail)),
            )
          ],
        ),
      ),
    );
  }
}
