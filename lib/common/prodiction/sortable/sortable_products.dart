import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/layout/grid_layout.dart';
import 'package:t_store/common/prodiction/prodict_carts/product_card_vertical.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popular'
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: ((value) {}),
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        TGridLayout(
            itemcount: 4,
            itemBuilder: (_, index) => const ProductCardVertical())
      ],
    );
  }
}
