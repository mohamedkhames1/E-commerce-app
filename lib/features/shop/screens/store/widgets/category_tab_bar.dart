import 'package:flutter/material.dart';
import 'package:t_store/common/brand/brand_show_case.dart';
import 'package:t_store/common/layout/grid_layout.dart';
import 'package:t_store/common/prodiction/prodict_carts/product_card_vertical.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/features/shop/models/category/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const TBrandShowCase(
            images: [
              TImages.productImage1,
              TImages.productImage2,
              TImages.productImage3,
            ],
          ),
          const TBrandShowCase(
            images: [
              TImages.productImage1,
              TImages.productImage2,
              TImages.productImage3,
            ],
          ),
          TSectionHeadline(
            title: 'You mite like',
            onpressing: () {},
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          TGridLayout(
              itemcount: 4,
              itemBuilder: (context, index) => const ProductCardVertical()),
        ],
      ),
    );
  }
}
