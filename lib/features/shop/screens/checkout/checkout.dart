import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/common/auth/success_screen.dart';
import 'package:t_store/common/prodiction/carts/copoun_code.dart';
import 'package:t_store/features/shop/screens/cart/widgets/t_cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showbackarrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(
                showAddAndRemoveButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const TCopounCode(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Container(
                padding: const EdgeInsets.all(TSizes.md),
                decoration: BoxDecoration(
                    border: Border.all(color: TColors.grey),
                    borderRadius: BorderRadius.circular(TSizes.md)),
                child: const Column(
                  children: [
                    TBillingAmount(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingPayment(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    TBillingAddress()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Success',
                subTitle: 'Your items will be shopped soon',
                press: () => Get.back(),
              )),
          child: const Text('Checkout \$ 256.0'),
        ),
      ),
    );
  }
}
