import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

import 'single_address.dart';

class UserAddressBody extends StatelessWidget {
  const UserAddressBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SingleAddress(
              isSelected: false,
            ),
            SingleAddress(
              isSelected: true,
            ),
          ],
        ),
      ),
    );
  }
}
