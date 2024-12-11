import 'package:flutter/material.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/circular_image.dart';
import 'package:t_store/common/text/t_branner_title_with_verify_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.ontap,
    required this.showBorder,
  });

  final VoidCallback? ontap;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.sm),
          border: showBorder
              ? Border.all(
                  color: TColors.grey,
                )
              : null,
        ),
        child: Row(
          children: [
            const Flexible(
              child: TCircularImage(
                image: TImages.clothIcon,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TBannerTitleWithVerifyIcon(
                    title: 'Nike',
                    textSizes: TextSizes.large,
                  ),
                  Text(
                    '256 Products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
