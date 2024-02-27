import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/circle_image_store.dart';
import 'package:shop_immi/common/widgets/textwidget/product_title.dart';
import 'package:shop_immi/features/shop_screens/screens/product_detail/product_detail_widgets.dart';
import 'package:shop_immi/features/shop_screens/widgets/store_widgets.dart';
import 'package:shop_immi/utils/constants/enums.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../../../common/rounded_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Positioned(
              top: 12,
              child: TRoundedContainer(
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                radius: TSizes.sm,
                bgColor: TColors.secondary.withOpacity(0.8),
                child: Text('25%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black)),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(
              price: '250',
              lineThrough: true,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(
              price: '198',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        const TProductTitle(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitle(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stocks', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            TCircleImage(
                width: 32,
                height: 32,
                overlayColor: dark ? TColors.white : TColors.black,
                image: TImages.nikeLogo),
            const TBrnadTtlVarifyIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
