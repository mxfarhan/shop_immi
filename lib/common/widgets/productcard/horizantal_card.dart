import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/rounded_container.dart';
import 'package:shop_immi/common/widgets/edge_rounded_img_banners.dart';
import 'package:shop_immi/common/widgets/textwidget/product_title.dart';
import 'package:shop_immi/features/shop_screens/screens/product_detail/product_detail_widgets.dart';
import 'package:shop_immi/features/shop_screens/widgets/store_widgets.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import 'circular_iconbtn.dart';

class TProductCardHorizantal extends StatelessWidget {
  const TProductCardHorizantal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.softGrey),
      child: Row(
        children: [
          TRoundedContainer(
            height: 115,
            padding: const EdgeInsets.all(TSizes.sm),
            bgColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                const SizedBox(
                    width: 120,
                    height: 120,
                    child: TRoundedImage(imageUrl: TImages.productImage2)),
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
                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    )),
              ],
            ),
          ),

          // Details

          SizedBox(
            width: 170,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitle(
                        title: 'Green Nike Shirts',
                        smallSize: true,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrnadTtlVarifyIcon(title: 'Nike')
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                          child: TProductPriceText(
                        price: '99.99',
                        isLarge: true,
                      )),
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.cardRadiusMd)),
                        ),
                        child: const SizedBox(
                          width: 34,
                          height: 34,
                          child: Center(
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
