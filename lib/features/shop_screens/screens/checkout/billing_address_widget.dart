import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          btnTitle: 'change',
          onPressed: () {},
        ),
        Text('Hani Khan',style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems/2),

        Row(children: [
          const Icon(Icons.phone,color: Colors.grey,size: 16),
          const SizedBox(width: TSizes.spaceBtwItems),
          Text('+92-324-4433234',style: Theme.of(context).textTheme.bodyMedium),
        ],),
        const SizedBox(height: TSizes.spaceBtwItems/2),
        Row(children: [
          const Icon(Icons.home,color: Colors.grey,size: 16),
          const SizedBox(width: TSizes.spaceBtwItems),
          Text('Chashma, Home No 23, Peshawar',style: Theme.of(context).textTheme.bodyMedium),
        ],),

      ],
    );
  }
}
