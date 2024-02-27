import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/common/widgets/gridlayout_home.dart';
import 'package:shop_immi/common/widgets/productcard/brand_card_storepage.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/features/shop_screens/screens/all_products/all_product_screen.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        backArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: 'Brands', showActionBtn: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              TGridLayout(
                  itemCount: 6,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => TBrandCardStorePage(
                        showBorder: true,
                        onTab: ()=>Get.to(()=>const ALlProductsScreen(appBarText: 'Nike',showBrandOnTop: true,)),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
