import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.title,
    required this.selected,
    this.onSelected,
  });

  final String title;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(title) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(title),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? TColors.white : null),
        avatar: isColor
            ? Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: THelperFunctions.getColor(title)),
              )
            : null,
        padding: isColor ? EdgeInsets.zero : null,
        backgroundColor: isColor ? THelperFunctions.getColor(title) : null,
        labelPadding: isColor ? EdgeInsets.zero : null,
        shape: isColor ? const CircleBorder() : null,
      ),
    );
  }
}
