import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/common/widgets/productcard/shimmer_loader.dart';
import 'package:shop_immi/common/widgets/textwidget/category_shimmer.dart';
import 'package:shop_immi/features/shop_screens/controllers/banner_controller.dart';
import 'package:shop_immi/features/shop_screens/controllers/category_controller.dart';
import 'package:shop_immi/features/shop_screens/screens/sub_category/sub_categories_screen.dart';

import '../../../common/widgets/circular_image_text_catgory_home.dart';
import '../../../common/widgets/clip_curver.dart';
import '../../../common/widgets/edge_rounded_img_banners.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../controllers/home_controler.dart';
// Circle Design used in backgrounds

class TCircleDesign extends StatelessWidget {
  const TCircleDesign({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.bgcolor = TColors.white,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: bgcolor,
      ),
      child: child,
    );
  }
}
/////////////////////home   header

class THomeHeader extends StatelessWidget {
  const THomeHeader({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurverWidgets(
      child: Container(
        padding: const EdgeInsets.all(0),
        color: TColors.primary,
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child:
                    TCircleDesign(bgcolor: TColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child:
                    TCircleDesign(bgcolor: TColors.textWhite.withOpacity(0.2))),
            child,
          ],
        ),
      ),
    );
  }
}
//////////Categories

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticleImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen(title: category.name)),
              );
            }),
      );
    });
  }
}

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerLoader(width: double.infinity, height: 190);
      }
      if(controller.banners.isEmpty){
        return const Center(child: Text('No data Found'));
      }else{
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.banners
                  .map((banner) => TRoundedImage(
                imageUrl: banner.imageUrl,
                isNetworkImg: true,
                onPressed: () => Get.toNamed(banner.targetScreen),
              ))
                  .toList(),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    TCircleDesign(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      bgcolor: controller.carousalCurrentIndex.value == i
                          ? TColors.primary
                          : TColors.grey,
                    ),
                ],
              ),
            )
          ],
        );
      }
    });
  }
}
