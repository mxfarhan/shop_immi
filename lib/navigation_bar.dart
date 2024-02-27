import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/features/personlization/screens/setting/setting_screen.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import 'features/shop_screens/screens/favouites/favouite_screen.dart';
import 'features/shop_screens/screens/home/home.dart';
import 'features/shop_screens/screens/store/store.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(NavigationController());
    final darkMode=THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: darkMode?TColors.black:TColors.white,
          indicatorColor: darkMode?TColors.white.withOpacity(0.1):TColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value=index,
          destinations:const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}
class NavigationController extends GetxController{
  final Rx<int> selectedIndex=0.obs;
  final screens =[const HomeScreen(),const Store(),const FavouriteScreen(),const SettingScreen(),];

}