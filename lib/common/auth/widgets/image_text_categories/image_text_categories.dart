import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/shimmer/t_shimmer_effect.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSectionImageText extends StatelessWidget {
  const TSectionImageText({
    super.key,
    required this.image,
    required this.title,
    this.ontap,
    this.background,
    this.textColor = TColors.white,
    this.isNetworkImage = true,
  });

  final String image, title;
  final VoidCallback? ontap;
  final Color? background;
  final Color textColor;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: background ?? (dark ? TColors.black : TColors.white),
              ),
              child: isNetworkImage
                  ? CachedNetworkImage(
                      color: dark ? TColors.white : TColors.dark,
                      fit: BoxFit.cover,
                      imageUrl: image,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const TShimmerEffect(
                        width: 55,
                        height: 55,
                        radius: 55,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Image(
                      image: AssetImage(image),
                      color: dark ? TColors.white : TColors.dark,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 50,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
