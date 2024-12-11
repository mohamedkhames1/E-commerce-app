import 'package:flutter/material.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/rounded_image.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBillingPayment extends StatelessWidget {
  const TBillingPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeadline(
          title: 'Payment Method',
          buttontitle: 'Change',
          onpressing: () {},
        ),
        Row(
          children: [
            TRoundedImage(
              imageUrl: TImages.paypal,
              width: 60,
              height: 35,
              padding: const EdgeInsets.all(TSizes.sm),
              background: dark ? TColors.light : TColors.dark,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              'PayPal',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        )
      ],
    );
  }
}
