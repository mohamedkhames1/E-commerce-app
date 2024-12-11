import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.background,
    this.iconColor,
    this.onpressing,
    required this.icon,
  });

  final double? width, height, size;
  final Color? background, iconColor;
  final VoidCallback? onpressing;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: background ??
            (dark
                ? TColors.dark.withOpacity(.9)
                : TColors.white.withOpacity(.9)),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
          color: iconColor,
        ),
        onPressed: onpressing,
      ),
    );
  }
}
