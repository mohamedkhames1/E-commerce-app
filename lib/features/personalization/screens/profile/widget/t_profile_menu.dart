import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onpressing,
    this.icon = Iconsax.arrow_right_34,
  });

  final String title, subTitle;
  final VoidCallback onpressing;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
            child: IconButton(
          icon: Icon(icon),
          onPressed: onpressing,
        ))
      ],
    );
  }
}
