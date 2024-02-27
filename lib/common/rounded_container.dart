import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius=TSizes.md,
    this.showBorder=true,
    this.border,
    this.bgColor=TColors.light,
    this.padding,
    this.onPressed,
    this.child,
    this.margin,this.borderColor=TColors.white,
  });

  final double? width, height;
  final double radius;
  final bool showBorder;
  final BoxBorder? border;
  final Widget? child;
  final Color bgColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            border:showBorder?Border.all(color: borderColor) :null,
            color: bgColor,
            borderRadius: BorderRadius.circular(radius)),
        child: child
      ),
    );
  }
}