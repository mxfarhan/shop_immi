import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/common/widgets/setting_menu_list.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/data/repositories/category_repository.dart';
import 'package:shop_immi/features/personlization/screens/profile_screen.dart';
import 'package:shop_immi/features/personlization/upload_screen_dummy_data.dart';
import 'package:shop_immi/features/shop_screens/screens/address/address_screen.dart';
import 'package:shop_immi/features/shop_screens/screens/cart/cart_screen.dart';
import 'package:shop_immi/features/shop_screens/screens/orders/orders_screen.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/dummy_data_models.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

import '../../../../common/widgets/productcard/user_profile_listtile.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../shop_screens/screens/auth_screens/login.dart';
import '../../../shop_screens/widgets/home_scree_widgets.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            THomeHeader(
                child: Column(
              children: [
                TAppBar(
                  title: Text('Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: TColors.white)),
                ),
                 TUserProLTile(onPressed: ()=>Get.to(()=>const ProfileScreen())),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeading(
                    title: 'Account Setting',
                    showActionBtn: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                   TSettingMenuTile(onTap: ()=>Get.to(()=>const UserAddressScreen()),
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subtitle: 'Set shopping address'),
                   TSettingMenuTile(onTap: ()=>Get.to(()=>const CartScreen()),
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'your shopping '),
                   TSettingMenuTile(onTap: ()=>Get.to(()=>const OrderScreen()),
                      icon: Iconsax.bag_tick,
                      title: 'My Order',
                      subtitle: 'Set  address'),
                  const TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subtitle: 'Set shopping address'),
                  const TSettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Address',
                      subtitle: 'Set shopping address'),
                  const TSettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Address',
                      subtitle: 'Set shopping address'),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                    title: 'Account Setting',
                    showActionBtn: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                   TSettingMenuTile(
                    onTap:()=>Get.to(()=>const UploadDummyDataScreen()),
                      icon: Iconsax.document_upload,
                      title: 'Upload Dummy data',
                      subtitle: 'Testing dummy category'),
                  TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subtitle: 'Set shopping address',
                      trailing: Switch(value: true, onChanged: (value) {})),
                  TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subtitle: 'Set shopping address',
                      trailing: Switch(value: false, onChanged: (value) {})),     TSettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Address',
                      subtitle: 'Set shopping address',
                      trailing: Switch(value: true, onChanged: (value) {})),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  SizedBox(width: double.infinity,
                  child: OutlinedButton(onPressed:()=>AuthenticationRepository.instance.logout() , child: const Text('Logout')),),
                  const SizedBox(height: TSizes.spaceBtwItems*1.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
