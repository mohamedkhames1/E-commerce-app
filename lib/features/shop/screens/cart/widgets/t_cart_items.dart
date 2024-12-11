import 'package:flutter/material.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/rounded_image.dart';
import 'package:t_store/common/prodiction/carts/add_remove_button.dart';
import 'package:t_store/common/text/product_price.dart';
import 'package:t_store/common/text/product_title.dart';
import 'package:t_store/common/text/t_branner_title_with_verify_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddAndRemoveButton = true,
  });
  final bool showAddAndRemoveButton;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => Row(
              children: [
                TRoundedImage(
                  imageUrl: TImages.productImage1,
                  width: 60,
                  height: 60,
                  background: dark ? TColors.darkerGrey : TColors.light,
                  padding: const EdgeInsets.all(TSizes.sm),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TBannerTitleWithVerifyIcon(title: 'Nike'),
                      const Flexible(
                        child: TProductTitleText(
                          title: 'Black Sports shoes ',
                          maxlines: 1,
                        ),
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'color ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: 'Green ',
                            style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(
                            text: 'Size ',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: 'Uk 08 ',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ])),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      if (showAddAndRemoveButton)
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TProductQuantitywithAddAndRemoveButton(),
                            ProductPrice(price: '256'),
                          ],
                        )
                    ],
                  ),
                )
              ],
            ),
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
        itemCount: 2);
  }
}
