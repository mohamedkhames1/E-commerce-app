import 'package:flutter/material.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/prodiction/sortable/sortable_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/t_brand_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Nike'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TBrandCard(showBorder: true),
            SizedBox(height: TSizes.spaceBtwSections),
            TSortableProducts()
          ],
        ),
      ),
    );
  }
}
