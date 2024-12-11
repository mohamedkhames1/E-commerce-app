import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/navigation_menu_control/navigation_menu_control.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: GetBuilder<NavigationController>(
        builder: (controller) => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex,
          onDestinationSelected: (value) {
            controller.changeSelectedIndex(value);
          },
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark
              ? TColors.white.withOpacity(.1)
              : TColors.black.withOpacity(.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Story'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: GetBuilder<NavigationController>(
        builder: (controller) => controller.screens[controller.selectedIndex],
      ),
    );
  }
}
