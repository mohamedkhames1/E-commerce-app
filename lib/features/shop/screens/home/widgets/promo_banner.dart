import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/rounded_image.dart';
import 'package:t_store/common/shimmer/t_shimmer_effect.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TPromoBanner extends StatelessWidget {
  const TPromoBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const TShimmerEffect(width: double.infinity, height: 150);
        } else if (controller.banners.isEmpty) {
          return const Center(
            child: Text('Not Data Found'),
          );
        } else {
          return Column(children: [
            CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) => controller.changepage(index),
                ),
                items: controller.banners
                    .map((banner) => TRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkimag: true,
                          ontap: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList()),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            GetBuilder<BannerController>(
              builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    AnimatedContainer(
                      width: controller.caruntpage == i ? 30 : 10,
                      height: 4,
                      margin: const EdgeInsets.only(right: TSizes.sm),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(TSizes.sm),
                          color: controller.caruntpage == i
                              ? TColors.primary
                              : TColors.grey),
                      duration: const Duration(milliseconds: 600),
                    ),
                ],
              ),
            )
          ]);
        }
      },
    );
  }
}
