import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_immi/common/rounded_container.dart';
import 'package:shop_immi/common/widgets/rating_bar_indicator.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Hani khan',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4.4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01 Aug, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'I recently purchased this product and Im extremely impressed.I recently purchased this product and Im extremely impressed.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' Show Less',
          trimCollapsedText: ' Show more',
          moreStyle: TextStyle(color: TColors.primary),
          lessStyle: TextStyle(color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        TRoundedContainer(
          bgColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nike', style: Theme.of(context).textTheme.titleMedium),
                    Text('01 Aug, 2023',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const ReadMoreText(
                  'I recently purchased this product and Im extremely impressed.I recently purchased this product and Im extremely impressed.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' Show Less',
                  trimCollapsedText: ' Show more',
                  moreStyle: TextStyle(color: TColors.primary),
                  lessStyle: TextStyle(color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
