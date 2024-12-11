import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/shimmer/t_shimmer_effect.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    required this.image,
  });
  final double width, height, padding;
  final Color? backgroundColor, overlayColor;
  final BoxFit? fit;
  final bool isNetworkImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: width,
      width: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor ?? (dark ? TColors.black : TColors.white)),
      child: Image(
        fit: fit,
        image: isNetworkImage
            ? CachedNetworkImage(
                color: overlayColor,
                fit: fit,
                imageUrl: NetworkImage(image).toString(),
                progressIndicatorBuilder: (context, url, progress) =>
                    const TShimmerEffect(
                  width: 55,
                  height: 55,
                  radius: 55,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ) as ImageProvider
            : AssetImage(image),
        color: overlayColor ?? (dark ? TColors.white : TColors.black),
      ),
    );
  }
}
