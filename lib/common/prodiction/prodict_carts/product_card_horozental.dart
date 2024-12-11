import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/rounded_image.dart';
import 'package:t_store/common/icon/circular_icons.dart';
import 'package:t_store/common/text/product_price.dart';
import 'package:t_store/common/text/product_title.dart';
import 'package:t_store/common/text/t_branner_title_with_verify_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductCardHorozental extends StatelessWidget {
  const ProductCardHorozental({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(
              color: dark ? TColors.dark : TColors.light,
              borderRadius: BorderRadius.circular(TSizes.md),
            ),
            child: Stack(
              children: [
                const TRoundedImage(
                  imageUrl: TImages.productImage1,
                  enableborderRedius: true,
                ),
                Positioned(
                  top: 12,
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
          ),
          SizedBox(
            width: 186,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: 'Nike Air Jordon Shoes ',
                        issmall: true,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TBannerTitleWithVerifyIcon(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: ProductPrice(
                          price: '35',
                          islarge: true,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              TSizes.cardRadiusMd,
                            ),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          height: TSizes.iconLg * 1.2,
                          width: TSizes.iconLg * 1.2,
                          child: Icon(
                            Iconsax.add,
                            color: TColors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
