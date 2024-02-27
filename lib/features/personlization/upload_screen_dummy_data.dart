import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/data/repositories/firebase_storage_service.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

import '../../common/widgets/setting_menu_list.dart';
import '../../data/repositories/category_repository.dart';
import '../../utils/constants/dummy_data_models.dart';
class UploadDummyDataScreen extends StatelessWidget {
  const UploadDummyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadDummyController=Get.put(CategoryRepository());
    final uploadBnaer=Get.put(TFirebaseStorageService());

    return  Scaffold(
      appBar: const TAppBar(title: Text('Upload Dummy Data'),backArrow: true,),
      body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child:Column(children: [
        TSettingMenuTile(
            onTap:()=>uploadDummyController.uploadDummyData(TDummyData.categories),
            icon: Iconsax.security,
            title: 'Upload Categories',
            subtitle: 'Testing dummy category'),
        TSettingMenuTile(
            onTap:()=>uploadDummyController.uploadBanner(TDummyData.banners),
            icon: Iconsax.security,
            title: 'Upload banners',
            subtitle: 'Testing dummy banners'),
      ],),
      ),),

    );
  }
}
