import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemcount,
    this.mainAxisextent = 295,
    required this.itemBuilder,
  });

  final int itemcount;
  final double mainAxisextent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemcount,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisSpacing: TSizes.gridViewSpacing + 10,
          mainAxisExtent: mainAxisextent,
          crossAxisCount: 2,
        ),
        itemBuilder: itemBuilder);
  }
}
