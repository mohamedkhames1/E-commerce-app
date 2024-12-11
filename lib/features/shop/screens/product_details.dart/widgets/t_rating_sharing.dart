import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TRateingAndShare extends StatelessWidget {
  const TRateingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              size: 24,
              color: Colors.amber,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: '5.0 ',
                      style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: TSizes.iconMd,
            ))
      ],
    );
  }
}
