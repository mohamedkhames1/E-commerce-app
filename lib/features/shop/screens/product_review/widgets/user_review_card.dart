import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/prodiction/rating/rating_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage2),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        Row(
          children: [
            const TRatingBarIndicator(
              rating: 4,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01-Nov-2023',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          'mohamed khames sayed 01555331878 mohamed khames sayed 01555331878 mohamed khames sayed 01555331878 mohamed khames sayed 01555331878 mohamed khames sayed 01555331878 ',
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          trimLines: 2,
          trimMode: TrimMode.Line,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.sm),
              color: dark ? TColors.darkerGrey : TColors.grey),
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'mo\'s Store',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      '01-Nov-2023',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'mohamed khames sayed 01555331878 mohamed khames sayed 01555331878 mohamed khames sayed 01555331878 mohamed khames sayed 01555331878 mohamed khames sayed 01555331878 ',
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        )
      ],
    );
  }
}
