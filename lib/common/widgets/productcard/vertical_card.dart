import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/rounded_container.dart';
import 'package:shop_immi/common/styles/shodow.dart';
import 'package:shop_immi/common/widgets/edge_rounded_img_banners.dart';
import 'package:shop_immi/features/shop_screens/screens/product_detail/product_detail_screen.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';
import '../../../features/shop_screens/widgets/store_widgets.dart';
import '../textwidget/product_title.dart';
import 'circular_iconbtn.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap:()=>Get.to(()=>const ProductDetail()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.ProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              showBorder: false,
              height: 180,
              padding: const EdgeInsets.all(TSizes.md),
              bgColor: dark ? TColors.dark : TColors.white,
              child: Stack(
                children: [
                  const TRoundedImage(
                    imageUrl: TImages.productImage1,
                    applyImageRadius: true,
                  ),
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
            const SizedBox(
              height: TSizes.spaceBtwItems / 2
            ),
             const Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitle(maxLines: 2,
                        title: 'Green Nike Shoes',
                        smallSize: false,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrnadTtlVarifyIcon(title: 'Nike'),
                    ])
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:TSizes.sm ),
                  child: Text(
                    //price
                      '\$46.7',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style:
                      Theme.of(context).textTheme.headlineSmall),
                ),
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

