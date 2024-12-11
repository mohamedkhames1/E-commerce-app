import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/layout/grid_layout.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/features/shop/screens/brands/brand_product.dart';
import 'package:t_store/features/shop/screens/store/widgets/t_brand_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeadline(
                title: 'Brands',
                showtextbutton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TGridLayout(
                itemcount: 4,
                itemBuilder: (_, index) => TBrandCard(
                  showBorder: true,
                  ontap: () => Get.to(() => const BrandProduct()),
                ),
                mainAxisextent: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
