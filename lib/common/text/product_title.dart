import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key,
    required this.title,
    this.issmall = false,
    this.maxlines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool issmall;
  final int maxlines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: issmall
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      textAlign: textAlign,
    );
  }
}
