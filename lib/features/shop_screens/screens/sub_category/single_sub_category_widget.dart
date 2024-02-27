import 'package:flutter/material.dart';
import '../../../../common/widgets/productcard/horizantal_card.dart';
import '../../../../common/widgets/textwidget/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class TProductCardSingleSubCateHorizantal extends StatelessWidget {
  const TProductCardSingleSubCateHorizantal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(title: 'Sports Shirts', onPressed: () {}),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        SizedBox(
          height: 120,
          child: ListView.separated(
              separatorBuilder: (context, index) =>const SizedBox(width: TSizes.spaceBtwItems),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const TProductCardHorizantal()),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

      ],
    );
  }
}
