import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/gridlayout_home.dart';
import 'package:shop_immi/common/widgets/productcard/vertical_card.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/features/shop_screens/shop_backend_controller/category_model.dart';

import '../../../common/widgets/textwidget/brand_showcase_storepage.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class TCategoryOfTab extends StatelessWidget {
  const TCategoryOfTab({
    super.key, required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowStorePage(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ]), const TBrandShowStorePage(images: [
                TImages.productImage1,
                TImages.productImage2,
                TImages.productImage3
              ]),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(title: 'You might Like',onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const TProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
