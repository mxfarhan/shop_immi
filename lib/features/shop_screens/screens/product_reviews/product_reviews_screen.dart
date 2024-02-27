import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/features/shop_screens/screens/product_reviews/product_rating_overall.dart';
import 'package:shop_immi/features/shop_screens/screens/product_reviews/user_review_card.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

import '../../../../common/widgets/rating_bar_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Reviews & Ratings'), backArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'I recently purchased this product and Im extremely impressed. Thhe quality is outstanding, and it exceeded my expectations. I highly recommend it to others'),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TProductRatingOverall(),
              const TRatingBarIndicator(rating: 3.6), //stars etc
              Text('22,343', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
