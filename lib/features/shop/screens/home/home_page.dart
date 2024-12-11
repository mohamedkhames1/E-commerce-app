import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

import 'widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.primary,
      body: HomePageBody(),
    );
  }
}
