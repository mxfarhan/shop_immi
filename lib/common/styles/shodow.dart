import 'package:flutter/material.dart';
import 'package:shop_immi/utils/constants/colors.dart';
class TShadowStyle{
  static final ProductShadow=BoxShadow(
    color: TColors.darkerGrey.withOpacity(0.12),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2)
  );

}