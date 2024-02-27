import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/features/shop_screens/screens/product_detail/bottom_add_cart.dart';
import 'package:shop_immi/features/shop_screens/screens/product_detail/product_attribute_widget.dart';
import 'package:shop_immi/features/shop_screens/screens/product_detail/product_detail_metadata.dart';
import 'package:shop_immi/features/shop_screens/screens/product_detail/product_detail_widgets.dart';
import 'package:shop_immi/features/shop_screens/screens/product_reviews/product_reviews_screen.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const TBottomAddCart(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductImageSlider(), //product top

            Padding(
                padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                ),
                child: Column(
                  children: [
                    const TRatingandShare(),
                    const TProductMetaData(),
                    const TProductAttribute(),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: const Text('Checkout')),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const TSectionHeading(
                      title: 'Discription',
                      showActionBtn: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const ReadMoreText(
                        'Lorem Ipsum is simply dummy text of the printing simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry galley of type and scrambled',
                    trimLines: 2,trimMode: TrimMode.Line,trimCollapsedText: ' Show more',
                      trimExpandedText: ' Less',
                      moreStyle: TextStyle(fontSize: 14,color: TColors.primary),
                      lessStyle: TextStyle(fontSize: 14,color: TColors.primary),
                    ),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TSectionHeading(title: 'Reviews(199)',showActionBtn: false,),
                        IconButton(onPressed: ()=>Get.to(()=>const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3)),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
