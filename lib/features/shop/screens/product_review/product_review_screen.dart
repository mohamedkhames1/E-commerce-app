import 'package:flutter/material.dart';
import 'package:t_store/common/app_bar/app_bar.dart';

import 'widgets/product_review_body.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Review & Rating'),
        showbackarrow: true,
      ),
      body: ProductReviewBody(),
    );
  }
}
