import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/prodiction/prodict_carts/widgets/vertical/image_love_button.dart';
import 'package:t_store/common/prodiction/prodict_carts/widgets/vertical/price_button_add.dart';
import 'package:t_store/common/prodiction/prodict_carts/widgets/vertical/title_panner_name.dart';
import 'package:t_store/common/style/shadow.dart';
import 'package:t_store/features/shop/screens/product_details.dart/product_details.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetails()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
          boxShadow: [TShadowStyle.productverticalShadow],
        ),
        child: const Column(
          children: [
            ImageAndloveButton(),
            SizedBox(
              height: TSizes.sm,
            ),
            TitleAndPanerName(),
            Spacer(),
            PriceAndAddButton()
          ],
        ),
      ),
    );
  }
}
