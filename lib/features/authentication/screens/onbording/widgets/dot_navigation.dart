import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers/onbording_controller/onbording_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class DotNavigation extends StatelessWidget {
  const DotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnbordingController());
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        effect: ExpandingDotsEffect(
            dotHeight: 6, dotColor: dark ? TColors.light : TColors.dark),
      ),
    );
  }
}
