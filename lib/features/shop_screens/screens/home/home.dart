import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/common/widgets/productcard/vertical_card.dart';
import 'package:shop_immi/features/shop_screens/screens/all_products/all_product_screen.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import '../../../../common/widgets/gridlayout_home.dart';
import '../../../../common/widgets/search_bar_home.dart';
import '../../../../common/widgets/textwidget/section_heading.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/home_scree_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const THomeHeader(
          child: Column(children: [
            HomeAppbar(),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            TSearchBar(
              text: 'Search in Store',
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Popular categories',
                    showActionBtn: false,
                    textColor: TColors.white,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  THomeCategories(),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TPromoSlider(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TSectionHeading(
                title: 'Popular Products',
                onPressed: () => Get.to(() => const ALlProductsScreen()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                  itemCount: 2,
                  itemBuilder: (_, index) => const TProductCardVertical())
            ],
          ),
        ),
      ],
    )));
  }
}
