import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/utils/constants/enums.dart';

import '../../../common/widgets/textwidget/brand_title.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TBrnadTtlVarifyIcon extends StatelessWidget {
  const TBrnadTtlVarifyIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primaryex,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitle(
            title: title,
            maxLines: maxLines,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5,
            color: iconColor, size: TSizes.iconXs),
      ],
    );
  }
}