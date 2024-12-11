import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_store/features/authentication/controllers/onbording_controller/onbording_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';

class OnbordingSkip extends GetView<OnbordingController> {
  const OnbordingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {
          controller.skipButton();
        },
        child: const Text(TTexts.skip),
      ),
    );
  }
}
