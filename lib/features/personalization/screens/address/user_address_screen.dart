import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/app_bar/app_bar.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/user_address_body.dart';
import 'package:t_store/utils/constants/colors.dart';

class UserAddressScreens extends StatelessWidget {
  const UserAddressScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: TColors.primary,
        child: const Icon(
          Icons.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showbackarrow: true,
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const UserAddressBody(),
    );
  }
}
