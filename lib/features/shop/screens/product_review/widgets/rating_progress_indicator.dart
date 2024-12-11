import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/device/device_utility.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * .8,
            child: LinearProgressIndicator(
              backgroundColor: TColors.grey,
              minHeight: 11,
              value: value,
              valueColor: const AlwaysStoppedAnimation(TColors.primary),
              borderRadius: const BorderRadius.all(Radius.circular(7)),
            ),
          ),
        )
      ],
    );
  }
}
