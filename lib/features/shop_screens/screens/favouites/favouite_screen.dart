import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/common/widgets/gridlayout_home.dart';
import 'package:shop_immi/common/widgets/productcard/circular_iconbtn.dart';
import 'package:shop_immi/common/widgets/productcard/vertical_card.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import '../home/home.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Iconsax.add,onPressed: ()=>Get.to(const HomeScreen())),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            TGridLayout(itemCount: 4, itemBuilder: (_,index)=>const TProductCardVertical())
          ],),
        ),
      ),
    );
  }
}
