import 'package:flutter/material.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAddress extends StatelessWidget {
  const TBillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeadline(
          title: 'Shipping Address',
          buttontitle: 'Change',
          onpressing: () {},
        ),
        Text(
          'Coding with mo',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: TColors.grey,
              size: 16,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              '01555331878',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(
              Icons.location_history,
              color: TColors.grey,
              size: 16,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
            Text(
              'beni suif city , Egypt',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        )
      ],
    );
  }
}
