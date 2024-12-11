import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/store/widgets/t_brand_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      padding: const EdgeInsets.all(TSizes.md),
      decoration: BoxDecoration(
        border: Border.all(color: TColors.darkGrey),
        borderRadius: BorderRadius.circular(TSizes.sm),
      ),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(left: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.sm),
          color: dark ? TColors.darkGrey : TColors.light,
        ),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
