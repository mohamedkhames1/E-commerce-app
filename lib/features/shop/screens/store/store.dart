import 'package:flutter/material.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/prodiction/cart_counter_Icon.dart';
import 'widgets/store_body.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: const [TCartCounterIcon()],
      ),
      body: const StoreBody(),
    );
  }
}
