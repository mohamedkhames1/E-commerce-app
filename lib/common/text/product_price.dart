import 'package:flutter/material.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(
      {super.key,
      required this.price,
      this.currencySign = '\$',
      this.maxLines = 1,
      this.islarge = false,
      this.lineThrough = false});

  final String price, currencySign;
  final int maxLines;
  final bool islarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: islarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
