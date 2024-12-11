import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../features/authentication/screens/auth/login/widgets/sucial_button.dart';

class DividerAndSucialAcounts extends StatelessWidget {
  const DividerAndSucialAcounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final dart = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                height: .5,
                indent: 60,
                endIndent: 5,
                color: dart ? TColors.darkGrey : TColors.grey,
              ),
            ),
            Text(
              TTexts.orSignInWith,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Expanded(
                child: Divider(
              color: dart ? TColors.darkGrey : TColors.grey,
              height: .5,
              indent: 5,
              endIndent: 60,
            ))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SucialButton(
              image: TImages.google,
              onpress: () => controller.googleSignin(),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            SucialButton(
              image: TImages.facebook,
              onpress: () {},
            ),
          ],
        )
      ],
    );
  }
}
