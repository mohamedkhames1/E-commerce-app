import 'package:flutter/material.dart';
import 'package:t_store/common/prodiction/rating/rating_indicator.dart';
import 'package:t_store/features/shop/screens/product_review/widgets/overall_product_rating.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'user_review_card.dart';

class ProductReviewBody extends StatelessWidget {
  const ProductReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'Ratings and reviews are verifed and are from people who use the same typy of device that you use.'),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          const TOverallProductRating(),
          const TRatingBarIndicator(
            rating: 3.5,
          ),
          Text(
            '12,611',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          const UserReviewCard(),
          const UserReviewCard(),
          const UserReviewCard(),
          const UserReviewCard(),
        ],
      ),
    ));
  }
}
