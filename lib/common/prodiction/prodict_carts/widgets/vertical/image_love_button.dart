import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/rounded_image.dart';
import 'package:t_store/common/icon/circular_icons.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ImageAndloveButton extends StatelessWidget {
  const ImageAndloveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: 180,
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.md),
        color: dark ? TColors.dark : TColors.light,
      ),
      child: Stack(
        children: [
          const TRoundedImage(
            imageUrl: TImages.productImage1,
            enableborderRedius: true,
          ),
          Positioned(
            top: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: TSizes.xs, horizontal: TSizes.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(TSizes.sm),
                color: TColors.secondary.withOpacity(.8),
              ),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
          ),
          const Positioned(
              right: 0,
              top: 0,
              child: TCircularIcon(
                icon: Iconsax.heart5,
                iconColor: Colors.red,
              )),
        ],
      ),
    );
  }
}
