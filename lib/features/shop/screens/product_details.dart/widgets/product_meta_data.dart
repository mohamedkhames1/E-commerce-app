import 'package:flutter/material.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/circular_image.dart';
import 'package:t_store/common/text/product_price.dart';
import 'package:t_store/common/text/product_title.dart';
import 'package:t_store/common/text/t_branner_title_with_verify_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
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
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const ProductPrice(
              price: '175',
              islarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        const TProductTitleText(title: 'Nike Air Max Red & Black'),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const TProductTitleText(title: 'Stock : '),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            TCircularImage(
                width: 36,
                height: 36,
                overlayColor: dark ? TColors.white : TColors.black,
                image: TImages.shoeIcon),
            const TBannerTitleWithVerifyIcon(
              title: 'Nike',
              textSizes: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
