import 'package:flutter/material.dart';
import 'package:t_store/common/auth/widgets/divider_sucial_acount.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'create_acount_button.dart';
import 'create_acount_form.dart';
import 'i_agree.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              TTexts.signupTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const CreateAcountForm(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const IAgree(),
            const CreateAcountButton(),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            const DividerAndSucialAcounts(),
          ],
        ),
      ),
    );
  }
}
