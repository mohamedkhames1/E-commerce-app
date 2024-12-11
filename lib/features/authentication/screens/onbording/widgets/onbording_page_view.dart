import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/onbording/onbording_data.dart';
import 'package:t_store/features/authentication/controllers/onbording_controller/onbording_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class OnbordingPageView extends GetView<OnbordingController> {
  const OnbordingPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnbordingController());

    return PageView.builder(
      itemCount: onbordingData.length,
      controller: controller.pageController,
      onPageChanged: (index) {
        controller.onPageChanged(index);
      },
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image.asset(
                onbordingData[index].image,
                width: THelperFunctions.screenWidth() * .8,
                height: THelperFunctions.screenHeight() * .6,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(
                onbordingData[index].title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Text(onbordingData[index].description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        );
      },
    );
  }
}
