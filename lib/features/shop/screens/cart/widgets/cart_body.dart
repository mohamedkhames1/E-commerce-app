import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 't_cart_items.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(TSizes.defaultSpace),
      child: TCartItems(),
    );
  }
}
