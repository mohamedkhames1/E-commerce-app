import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/shimmer/t_shimmer_effect.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.background,
    this.isNetworkimag = false,
    this.enableborderRedius = true,
    this.ontap,
    this.border,
    this.borderRedius = TSizes.sm,
    this.padding,
    this.overlayColor,
  });

  final double? width, height;
  final String imageUrl;
  final BoxFit? fit;
  final Color? background;
  final Color? overlayColor;
  final bool isNetworkimag, enableborderRedius;
  final VoidCallback? ontap;
  final BoxBorder? border;
  final double borderRedius;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRedius),
            color: background,
            border: border),
        child: ClipRRect(
          borderRadius: enableborderRedius
              ? BorderRadius.circular(borderRedius)
              : BorderRadius.zero,
          child: isNetworkimag
              ? CachedNetworkImage(
                  color: overlayColor,
                  fit: fit,
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const TShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 55,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(
                    imageUrl,
                  ),
                  fit: fit,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
