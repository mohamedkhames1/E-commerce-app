import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/common/app_bar/t_tap_bar.dart';
import 'package:t_store/common/container_shaps/container_search.dart';
import 'package:t_store/common/layout/grid_layout.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/features/shop/screens/brands/all_brand.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab_bar.dart';
import 'package:t_store/features/shop/screens/store/widgets/t_brand_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../controllers/category_controller.dart';

class StoreBody extends StatelessWidget {
  const StoreBody({super.key});

  @override
  Widget build(BuildContext context) {
    final category = CategoryController.instace.featuredCategories();
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: dark ? TColors.black : TColors.white,
              automaticallyImplyLeading: false,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    const TSearchContainer(
                      title: 'Search in Store',
                      padding: EdgeInsets.zero,
                      showBbackground: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TSectionHeadline(
                      title: 'Feature Brands',
                      onpressing: () => Get.to(() => const AllBrands()),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 1.5,
                    ),
                    TGridLayout(
                      itemcount: 4,
                      mainAxisextent: 80,
                      itemBuilder: (_, index) {
                        return const TBrandCard(
                          showBorder: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
              bottom: TTabBar(
                  tabs: category
                      .map((category) => Tab(child: Text(category.name)))
                      .toList()),
            )
          ];
        },
        body: TabBarView(
            children: category
                .map((category) => CategoryTabBar(
                      category: category,
                    ))
                .toList()),
      ),
    );
  }
}
