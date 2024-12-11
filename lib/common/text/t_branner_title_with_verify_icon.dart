import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/text/brand_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBannerTitleWithVerifyIcon extends StatelessWidget {
  const TBannerTitleWithVerifyIcon({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textAlign = TextAlign.center,
    this.textSizes = TextSizes.small,
    this.textColor,
    this.iconColor = TColors.primary,
  });
  final String title;
  final int maxlines;
  final TextAlign textAlign;
  final TextSizes textSizes;
  final Color? textColor, iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TbrandTextTitle(
          title: title,
          maxlines: maxlines,
          textAlign: textAlign,
          textColor: textColor,
          textSizes: textSizes,
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}
