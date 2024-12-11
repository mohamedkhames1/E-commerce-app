import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/common/auth/widgets/home_background.dart';
import 'package:t_store/common/container_shaps/container_search.dart';
import 'package:t_store/common/layout/grid_layout.dart';
import 'package:t_store/common/prodiction/prodict_carts/product_card_vertical.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'home_app_bar.dart';
import 'home_categories.dart';
import 'promo_banner.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HomeBackGround(
        child: Column(
          children: [
            const HomeAppBar(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const TSearchContainer(
              title: 'Search in Store',
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            const Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeadline(
                    title: 'Popular Categories',
                    textColor: TColors.white,
                    showtextbutton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  HomeCategories()
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 2.4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: TPromoBanner(),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeadline(
                    title: 'Popular Categories',
                    onpressing: () => Get.to(() => const AllPorducts()),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TGridLayout(
                      itemcount: 4,
                      itemBuilder: (context, index) =>
                          const ProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
