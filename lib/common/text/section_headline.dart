import 'package:flutter/material.dart';

class TSectionHeadline extends StatelessWidget {
  const TSectionHeadline({
    super.key,
    required this.title,
    this.buttontitle = 'View all',
    this.onpressing,
    this.showtextbutton = true,
    this.textColor,
  });
  final Color? textColor;
  final String title, buttontitle;
  final VoidCallback? onpressing;
  final bool showtextbutton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showtextbutton)
          TextButton(onPressed: onpressing, child: Text(buttontitle))
      ],
    );
  }
}
