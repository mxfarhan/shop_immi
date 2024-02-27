import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/textwidget/product_title.dart';

import '../../features/shop_screens/widgets/store_widgets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import 'edge_rounded_img_banners.dart';

class TCartItemSingle extends StatelessWidget {
  const TCartItemSingle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.productImage2,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          bgColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrnadTtlVarifyIcon(title: 'Nike'),
              const Flexible(child: TProductTitle(title: 'Sports Shoes',maxLines: 1)),
              Text.rich(TextSpan(
                  children: [
                    TextSpan(text: 'Color  ',style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green  ',style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size  ',style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'UK 88 ',style: Theme.of(context).textTheme.bodyLarge),
                  ]
              ))


            ],),
        )
      ],
    );
  }
}
