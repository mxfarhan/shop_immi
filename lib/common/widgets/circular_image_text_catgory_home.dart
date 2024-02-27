import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/circle_image_store.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class TVerticleImageText extends StatelessWidget {
  const TVerticleImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.bgColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? bgColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TCircleImage(
              overlayColor: dark?Colors.white:Colors.black,
              image: image,isNetworkImg: true,fit: BoxFit.cover,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
