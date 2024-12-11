import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/icon/circular_icons.dart';
import 'package:t_store/features/shop/screens/home/home_page.dart';

import 'widgets/wishlist_body.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onpressing: () => Get.to(() => const HomePage()),
          )
        ],
      ),
      body: const WishListBody(),
    );
  }
}
