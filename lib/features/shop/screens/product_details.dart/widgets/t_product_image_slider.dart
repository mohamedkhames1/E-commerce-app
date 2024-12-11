import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/rounded_image.dart';
import 'package:t_store/common/icon/circular_icons.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        const SizedBox(
          height: 380,
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace * 2),
            child: Center(
              child: Image(
                image: AssetImage(TImages.productImage3),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          right: 0,
          left: TSizes.defaultSpace,
          child: SizedBox(
            height: 80,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return TRoundedImage(
                  background: dark ? TColors.dark : TColors.white,
                  border: Border.all(color: TColors.primary),
                  padding: const EdgeInsets.all(TSizes.sm),
                  width: 80,
                  imageUrl: TImages.productImage5,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              itemCount: 6,
            ),
          ),
        ),
        const TAppBar(
          showbackarrow: true,
          actions: [
            TCircularIcon(
              icon: Iconsax.heart5,
              iconColor: Colors.red,
            )
          ],
        )
      ],
    );
  }
}
