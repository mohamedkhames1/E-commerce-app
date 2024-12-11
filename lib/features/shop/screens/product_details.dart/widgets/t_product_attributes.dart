import 'package:flutter/material.dart';
import 'package:t_store/common/chips/t_choice_chip.dart';
import 'package:t_store/common/text/product_price.dart';
import 'package:t_store/common/text/product_title.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductAttributs extends StatelessWidget {
  const TProductAttributs({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.sm),
              color: dark ? TColors.darkerGrey : TColors.grey),
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeadline(
                    title: "Variation ",
                    showtextbutton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: "price : "),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          const ProductPrice(price: '20')
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock : '),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const TProductTitleText(
                title:
                    'this is the Description of the Product and it can go up to max 4 lines ',
                issmall: true,
                maxlines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeadline(
              title: 'Colors',
              showtextbutton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  title: 'Green',
                  selected: true,
                  onSelected: (v) {},
                ),
                TChoiceChip(
                  title: 'Blue',
                  selected: false,
                  onSelected: (v) {},
                ),
                TChoiceChip(
                  title: 'Yellow',
                  selected: false,
                  onSelected: (v) {},
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeadline(
              title: 'Colors',
              showtextbutton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  title: 'EU 34',
                  selected: true,
                  onSelected: (v) {},
                ),
                TChoiceChip(
                  title: 'EU 36',
                  selected: false,
                  onSelected: (v) {},
                ),
                TChoiceChip(
                  title: 'EU 38',
                  selected: false,
                  onSelected: (v) {},
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
