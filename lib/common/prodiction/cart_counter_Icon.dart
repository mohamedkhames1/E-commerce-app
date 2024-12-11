import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/data/dumy_data.dart/dumy_data.dart';
import 'package:t_store/data/repositories/categores/category_repositry.dart';
import 'package:t_store/features/shop/screens/cart/cart_screen.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.iconColor,
  });
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final repositry = Get.put(CategoryRepositry());
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            repositry.uploadDomyData(DumyData.categories);
            Get.to(() => const CartScreen());
          },
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor ?? (dark ? TColors.white : TColors.black),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: TColors.black, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.white, fontSizeFactor: .8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
