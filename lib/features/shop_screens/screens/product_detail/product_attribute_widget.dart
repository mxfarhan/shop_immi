import 'package:flutter/material.dart';
import 'package:shop_immi/common/rounded_container.dart';
import 'package:shop_immi/common/widgets/textwidget/product_title.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/features/shop_screens/screens/product_detail/product_detail_widgets.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/choice_chip.dart';

class TProductAttribute extends StatelessWidget {
  const TProductAttribute({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          bgColor: dark ? TColors.darkerGrey : TColors.grey,
          child: const Column(
            children: [
              Row(
                children: [
                  TSectionHeading(
                    title: 'Variation',
                    showActionBtn: false,
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TProductTitle(title: 'Price:', smallSize: true),
                          SizedBox(width: TSizes.spaceBtwItems),
                          TProductPriceText(price: '25', lineThrough: true),
                          SizedBox(width: TSizes.spaceBtwItems),
                          TProductPriceText(price: '20'),
                        ],
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 8),
                      Row(
                        children: [
                          TProductTitle(title: 'Stock:', smallSize: true),
                          SizedBox(width: TSizes.spaceBtwItems),
                          TProductTitle(title: 'In Stock')
                        ],
                      )
                    ],
                  ),
                ],
              ),
              TProductTitle(
                title:
                    'This is very good fireh test good fireh test good fireh test goof eysy snn line 4.',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Color',showActionBtn: false,),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
           Wrap(
             spacing: 8,
             children: [
             TChoiceChip(text: 'Green',selected:true,onSelected: (value){},),
             TChoiceChip(text: 'Blue',selected:false,onSelected: (value){},),
             TChoiceChip(text: 'Red',selected:false,onSelected: (value){},),
           ],),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
          ],
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Sizes',showActionBtn: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
              TChoiceChip(text: 'LO 34',selected:true,onSelected: (value){},),
              TChoiceChip(text: 'LO 44',selected:false,onSelected: (value){},),
              TChoiceChip(text: 'KO 38',selected:false,onSelected: (value){},),

            ],)
            ],
        )
      ],
    );
  }
}