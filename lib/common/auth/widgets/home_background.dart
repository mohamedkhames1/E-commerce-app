import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'custom_shapes/circule_container.dart';

class HomeBackGround extends StatelessWidget {
  const HomeBackGround({
    super.key,
    required this.child,
    this.screenHeight = 2,
    this.topPadding = .52,
    this.showcircular = true,
  });
  final Widget child;
  final double screenHeight, topPadding;
  final bool? showcircular;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SizedBox(
      //height: double.infinity,
      height: THelperFunctions.screenHeight() * screenHeight,
      child: Stack(
        children: [
          if (showcircular!)
            const Positioned(
                top: -150, right: -250, child: TCirculeContainer()),
          if (showcircular!)
            const Positioned(top: 100, right: -300, child: TCirculeContainer()),
          Container(
            margin: EdgeInsets.only(
                top: THelperFunctions.screenHeight() * topPadding),
            decoration: BoxDecoration(
              color: dark ? TColors.dark : TColors.light,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
          ),
          child
        ],
      ),
    );
  }
}
