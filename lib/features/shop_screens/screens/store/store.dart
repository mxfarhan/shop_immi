import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/common/widgets/cart_couter_home.dart';
import 'package:shop_immi/common/widgets/gridlayout_home.dart';
import 'package:shop_immi/common/widgets/search_bar_home.dart';
import 'package:shop_immi/common/widgets/tabBar_store_page.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/features/shop_screens/controllers/category_controller.dart';
import 'package:shop_immi/features/shop_screens/screens/brands/brand_screen.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_appBar.dart';
import '../../../../common/widgets/productcard/brand_card_storepage.dart';
import '../../widgets/store_tabbar_category.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final categorieCtr = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categorieCtr.length,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounter(onPressed: () {}),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxScroll) {
            return [
              SliverAppBar(
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),
                        const TSearchBar(
                          text: 'Search in Store',
                          showBorder: true,
                          showBgColor: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        TSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () => Get.to(() => const AllBrandScreen()),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 75,
                            itemBuilder: (_, index) {
                              return const TBrandCardStorePage();
                            }),
                      ],
                    ),
                  ),
                  bottom: TTabBar(
                      tabs: categorieCtr
                          .map((category) => Tab(
                                child: Text(category.name),
                              ))
                          .toList())),
            ];
          },
          body: TabBarView(
            children: categorieCtr
                .map((category) => TCategoryOfTab(
                      category: category,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
