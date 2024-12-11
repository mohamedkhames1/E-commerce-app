import 'package:flutter/material.dart';
import 'package:t_store/common/layout/grid_layout.dart';
import 'package:t_store/common/prodiction/prodict_carts/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class WishListBody extends StatelessWidget {
  const WishListBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TGridLayout(
                itemcount: 6,
                itemBuilder: (_, index) => const ProductCardVertical())
          ],
        ),
      ),
    );
  }
}
