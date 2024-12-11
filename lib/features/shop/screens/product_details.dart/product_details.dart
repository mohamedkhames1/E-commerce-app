import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_details.dart/widgets/product_details_body.dart';
import 'package:t_store/features/shop/screens/product_details.dart/widgets/t_bottom_add_cart.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? TColors.darkerGrey : TColors.light,
      body: const ProductDetailsBody(),
      bottomNavigationBar: const TBottomAddToCard(),
    );
  }
}
