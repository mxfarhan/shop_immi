import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/clip_curver.dart';
import '../../../../common/widgets/custom_appBar.dart';
import '../../../../common/widgets/edge_rounded_img_banners.dart';
import '../../../../common/widgets/productcard/circular_iconbtn.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurverWidgets(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            const SizedBox(
                height: 400,
                child: Padding(
                  padding:
                  EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: Image(
                          image: AssetImage(TImages.productImage5))),
                )),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemCount: 6,
                  itemBuilder: (_, index) => TRoundedImage(
                      width: 80,
                      bgColor: dark ? TColors.dark : TColors.white,
                      border: Border.all(color: TColors.primary),
                      padding: const EdgeInsets.all(TSizes.sm),
                      imageUrl: TImages.productImage3),
                ),
              ),
            ),
            const TAppBar(
              backArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


////////////////////  ratings and share

class TRatingandShare extends StatelessWidget {
  const TRatingandShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [
          const Icon(Iconsax.star5,color: Colors.amber,size: 24),
          const SizedBox(width: TSizes.spaceBtwItems/2),
          Text.rich(TextSpan(children: [
            TextSpan(text: '4.9 ',style: Theme.of(context).textTheme.bodyLarge),
            const TextSpan(text: '(199)'),
          ]))
        ],),
        IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: TSizes.iconMd,))
      ],);
  }
}

///////////////// price text

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key, this.lineThrough=false, this.isLarge=false, this.maxlines=1, this.sign='\$', required this.price,
  });

  final bool lineThrough;
  final bool isLarge;
  final int maxlines;
  final String sign, price;

  @override
  Widget build(BuildContext context) {
    return Text(
        sign+price,
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,

        style: isLarge
            ? Theme
            .of(context)
            .textTheme
            .headlineMedium!
            .apply(decoration: lineThrough ? TextDecoration.lineThrough:null):
        Theme
            .of(context)
            .textTheme
            .titleLarge!
            .apply(decoration: lineThrough ? TextDecoration.lineThrough:null)
    );
  }
}