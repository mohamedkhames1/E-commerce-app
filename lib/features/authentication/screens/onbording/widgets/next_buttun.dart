import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/onbording_controller/onbording_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';

class NextButtunOnbording extends StatelessWidget {
  const NextButtunOnbording({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnbordingController());
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () {
            controller.nextPage();
          },
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
