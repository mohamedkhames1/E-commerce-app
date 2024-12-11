import 'package:flutter/material.dart';
import 'package:t_store/common/app_bar/app_bar.dart';

import 'widgets/new_address_body.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Add New Address'),
        showbackarrow: true,
      ),
      body: NewAddressBody(),
    );
  }
}
