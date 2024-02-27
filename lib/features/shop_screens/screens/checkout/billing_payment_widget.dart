import 'package:flutter/material.dart';
import 'package:shop_immi/common/rounded_container.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          btnTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              borderColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
