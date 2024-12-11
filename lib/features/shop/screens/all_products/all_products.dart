import 'package:flutter/material.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/prodiction/sortable/sortable_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class AllPorducts extends StatelessWidget {
  const AllPorducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text(
          'Popular Porducts',
        ),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}
