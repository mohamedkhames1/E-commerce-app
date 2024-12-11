import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

import 'widgets/setting_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: TColors.primary,
      body: SettingBody(),
    );
  }
}
