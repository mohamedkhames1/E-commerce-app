import 'package:flutter/material.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'widgets/order_list_items.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showbackarrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: OrderListItems(),
      ),
    );
  }
}
