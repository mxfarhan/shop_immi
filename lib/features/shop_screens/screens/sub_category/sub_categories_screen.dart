import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/common/widgets/edge_rounded_img_banners.dart';
import 'package:shop_immi/features/shop_screens/controllers/category_controller.dart';
import 'package:shop_immi/features/shop_screens/screens/sub_category/single_sub_category_widget.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    return  Scaffold(
      appBar: TAppBar(
        title: Text(title),
        backArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TRoundedImage(
                imageUrl: TImages.promoBanner3,
                width: double.infinity,
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              Column(
                children: [
                  TProductCardSingleSubCateHorizantal(),
                  TProductCardSingleSubCateHorizantal(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}