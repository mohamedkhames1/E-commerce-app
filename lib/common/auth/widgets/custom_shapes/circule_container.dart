import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TCirculeContainer extends StatelessWidget {
  const TCirculeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400),
          color: TColors.white.withOpacity(.1)),
    );
  }
}
