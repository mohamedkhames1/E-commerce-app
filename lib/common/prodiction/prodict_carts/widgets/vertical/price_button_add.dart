import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/text/product_price.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class PriceAndAddButton extends StatelessWidget {
  const PriceAndAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
            padding: EdgeInsets.only(left: TSizes.sm),
            child: ProductPrice(
              price: '35',
              islarge: true,
            )),
        Container(
          decoration: const BoxDecoration(
            color: TColors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                TSizes.cardRadiusMd,
              ),
              bottomRight: Radius.circular(TSizes.productImageRadius),
            ),
          ),
          child: const SizedBox(
            height: TSizes.iconLg * 1.5,
            width: TSizes.iconLg * 1.5,
            child: Icon(
              Iconsax.add,
              color: TColors.white,
            ),
          ),
        )
      ],
    );
  }
}
