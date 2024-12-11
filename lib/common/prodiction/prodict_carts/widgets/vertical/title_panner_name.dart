import 'package:flutter/material.dart';
import 'package:t_store/common/text/product_title.dart';
import 'package:t_store/common/text/t_branner_title_with_verify_icon.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TitleAndPanerName extends StatelessWidget {
  const TitleAndPanerName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: TSizes.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TProductTitleText(
            title: 'Green Nike Air Shows',
            issmall: true,
          ),
          SizedBox(
            height: TSizes.sm,
          ),
          TBannerTitleWithVerifyIcon(
            title: 'Nike',
          ),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
