import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/enums.dart';

class TbrandTextTitle extends StatelessWidget {
  const TbrandTextTitle({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textAlign = TextAlign.center,
    this.textSizes = TextSizes.small,
    this.textColor,
  });
  final String title;
  final int maxlines;
  final TextAlign textAlign;
  final TextSizes textSizes;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: textSizes == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
          : textSizes == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
              : textSizes == TextSizes.large
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: textColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: textColor),
    );
  }
}
