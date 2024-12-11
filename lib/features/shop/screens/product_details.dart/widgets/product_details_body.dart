import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/auth/widgets/home_background.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/features/shop/screens/product_details.dart/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details.dart/widgets/t_product_image_slider.dart';
import 'package:t_store/features/shop/screens/product_review/product_review_screen.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 't_product_attributes.dart';
import 't_rating_sharing.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HomeBackGround(
        showcircular: false,
        child: Column(
          children: [
            const TProductImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const TRateingAndShare(),
                  const ProductMetaData(),
                  const TProductAttributs(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeadline(
                    title: 'Description',
                    showtextbutton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    'this is a product description for Blue Nike Sleeve less vest , There are more things that can be added but i am just procticing and nothing else.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'show more',
                    trimExpandedText: 'less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeadline(
                        title: 'Reviews (199)',
                        showtextbutton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewScreen()),
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
