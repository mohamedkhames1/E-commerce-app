import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

class SucialButton extends StatelessWidget {
  const SucialButton({super.key, required this.image, required this.onpress});
  final String image;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: TColors.grey),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: onpress,
        icon: Image(
          image: AssetImage(image),
          height: TSizes.iconLg,
          width: TSizes.iconLg,
        ),
      ),
    );
  }
}
