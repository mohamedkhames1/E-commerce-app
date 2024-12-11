import 'package:flutter/material.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/auth/widgets/custom_shapes/rounded_image/rounded_image.dart';
import 'package:t_store/common/prodiction/prodict_carts/product_card_horozental.dart';
import 'package:t_store/common/text/section_headline.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SubCategores extends StatelessWidget {
  const SubCategores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Sports',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const TRoundedImage(
              imageUrl: TImages.promoBanner1,
              width: double.infinity,
              enableborderRedius: true,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Column(
              children: [
                TSectionHeadline(
                  title: 'Shorts Shirts',
                  onpressing: () {},
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemBuilder: (_, index) => const ProductCardHorozental(),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) => const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
