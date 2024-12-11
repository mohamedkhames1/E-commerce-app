import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.title,
    this.showBbackground = true,
    this.showBorder = true,
    this.icon = Iconsax.search_normal,
    this.ontap,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });
  final String title;
  final bool showBbackground, showBorder;
  final IconData? icon;
  final VoidCallback? ontap;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: padding,
        child: Container(
          padding: const EdgeInsets.all(TSizes.md),
          width: TDeviceUtils.getScreenWidth(context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            color: showBbackground
                ? dark
                    ? TColors.dark
                    : TColors.light
                : Colors.transparent,
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: TColors.darkGrey,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
