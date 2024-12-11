import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'widgets/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showbackarrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const CartBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => const Checkout()),
          child: const Text('Checkout \$ 256.0'),
        ),
      ),
    );
  }
}
