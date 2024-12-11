import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/prodiction/cart_counter_Icon.dart';
import 'package:t_store/common/shimmer/t_shimmer_effect.dart';
import 'package:t_store/features/personalization/controller/user/user_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: TColors.grey,
                ),
          ),
          Obx(
            () {
              if (controller.profileloding.value) {
                return const TShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                );
              }
            },
          ),
        ],
      ),
      actions: const [
        TCartCounterIcon(
          iconColor: TColors.white,
        )
      ],
    );
  }
}
