import 'package:flutter/material.dart';
import '../../../features/shop_screens/widgets/store_widgets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../rounded_container.dart';
import '../circle_image_store.dart';
import '../textwidget/brand_title.dart';

//////////////////////Brand Card On Store

class TBrandCardStorePage extends StatelessWidget {
  const TBrandCardStorePage({
    super.key, this.onTab,this.showBorder=false,
  });
  final void Function()? onTab;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: TRoundedContainer(
        padding:  const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        bgColor: Colors.transparent,
        borderColor: TColors.grey,
        child: Row(
          children: [
            Flexible(
              child: TCircleImage(
                image: TImages.clothIcon,
                overlayColor:
                THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.dark,
                bgColor: Colors.transparent,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
              const Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  TBrnadTtlVarifyIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  TBrandTitle(
                    title: '256 Products',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
