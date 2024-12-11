import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TShadowStyle {
  static final productverticalShadow = BoxShadow(
    color: TColors.dark.withOpacity(.1),
    blurRadius: 50,
    offset: const Offset(0, 2),
    spreadRadius: 7,
  );
}
