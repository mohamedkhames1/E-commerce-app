import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TAnimationLoader extends StatelessWidget {
  const TAnimationLoader(
      {super.key,
      required this.animation,
      required this.text,
      this.actionText,
      this.showAction = false,
      this.onPressed});

  final String animation;
  final String text;
  final String? actionText;
  final bool showAction;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Lottie.asset(animation, width: THelperFunctions.screenWidth() * .8),
        const SizedBox(
          height: TSizes.defaultSpace,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.defaultSpace,
        ),
        showAction
            ? OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                child: Text(
                  actionText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.light),
                ),
              )
            : const SizedBox()
      ],
    ));
  }
}
