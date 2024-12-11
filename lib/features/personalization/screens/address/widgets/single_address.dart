import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        color:
            isSelected ? TColors.primary.withOpacity(.5) : Colors.transparent,
        border: Border.all(
            color: isSelected
                ? Colors.transparent
                : dark
                    ? TColors.darkGrey
                    : TColors.grey),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              isSelected ? Iconsax.tick_circle5 : null,
              color: isSelected
                  ? dark
                      ? TColors.light
                      : TColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe ',
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              const Text(
                '01555331878',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(
                height: TSizes.sm / 2,
              ),
              const Text(
                '455 Street 15 bani suif city , Egypt country ',
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
