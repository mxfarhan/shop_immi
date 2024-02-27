import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/common/widgets/gridlayout_home.dart';
import 'package:shop_immi/common/widgets/productcard/brand_card_storepage.dart';
import 'package:shop_immi/common/widgets/productcard/vertical_card.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

class ALlProductsScreen extends StatelessWidget {
  const ALlProductsScreen({super.key,
    this.showBrandOnTop=false,
    this.appBarText='Popular Products'});

  final bool showBrandOnTop;
  final String appBarText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  TAppBar(
        title: Text(appBarText),
        backArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
             showBrandOnTop? const Padding(
               padding: EdgeInsets.only(bottom: TSizes.spaceBtwSections),
               child: TBrandCardStorePage(showBorder: true),
             ):const SizedBox(height: 0,width: 0),
              DropdownButtonFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.sort),
                  ),
                  items: ['Name', 'Price', 'Sale', 'Newest', 'Popularity']
                      .map((option) =>
                          DropdownMenuItem(value: option, child: Text(option)))
                      .toList(),
                  onChanged: (value) {}),
              const SizedBox(height: TSizes.spaceBtwSections),
              TGridLayout(
                itemCount: 8,
                itemBuilder: (_, index) => const TProductCardVertical(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
