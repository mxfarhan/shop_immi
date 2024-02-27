import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/productcard/shimmer_loader.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key,
    this.itemCount=6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          separatorBuilder: (_,__)=>const SizedBox(width: TSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerLoader(width: 55, height: 55,radius: 100,),
                SizedBox(height: TSizes.spaceBtwItems/2),
                TShimmerLoader(width: 55, height: 10),
              ],
            );
          }),
    );
  }
}
