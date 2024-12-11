import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/icon/circular_icons.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductQuantitywithAddAndRemoveButton extends StatelessWidget {
  const TProductQuantitywithAddAndRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          background: dark ? TColors.darkerGrey : TColors.light,
          size: TSizes.md,
          iconColor: dark ? TColors.white : TColors.black,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Text(
          '2',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        const TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          background: TColors.primary,
          size: TSizes.md,
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
