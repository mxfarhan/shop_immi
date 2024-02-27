import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/widgets/productcard/circular_iconbtn.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

class TBottomAddCart extends StatelessWidget {
  const TBottomAddCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus,
                height: 40,
                bgColor: TColors.darkGrey,
                width: 40,
                color: TColors.white,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: TSizes.spaceBtwItems),
              const TCircularIcon(
                icon: Iconsax.add,
                height: 40,
                bgColor: TColors.black,
                width: 40,
                color: TColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),

            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
