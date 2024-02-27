import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_immi/common/widgets/circle_image_store.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/common/widgets/productcard/shimmer_loader.dart';
import 'package:shop_immi/common/widgets/textwidget/section_heading.dart';
import 'package:shop_immi/features/personlization/screens/setting/change_name.dart';
import 'package:shop_immi/features/personlization/widgets/profile_menu_info.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/user_controller.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        backArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profile;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : TImages.userr;
                      return controller.imageUploading.value
                          ? TShimmerLoader(width: 88, height: 88, radius: 88)
                          : TCircleImage(
                              width: 80,
                              height: 80,
                              image: image,
                              isNetworkImg: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Profile Information',
                showActionBtn: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileInfo(
                  title: 'Name',
                  titValue: controller.user.value.fullNameCapital,
                  onPressed: () => Get.to(() => ChangeNameScreen())),
              TProfileInfo(
                  onPressed: () {},
                  title: 'username',
                  titValue: controller.user.value.username),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Personal Information',
                showActionBtn: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileInfo(
                  onPressed: () {},
                  title: 'User-ID',
                  titValue: controller.user.value.id),
              TProfileInfo(
                  onPressed: () {},
                  title: 'E-mail',
                  titValue: controller.user.value.email),
              TProfileInfo(
                  onPressed: () {},
                  title: 'Phone No:',
                  titValue: controller.user.value.phoneNumber),
              TProfileInfo(onPressed: () {}, title: 'Gender', titValue: 'Male'),
              TProfileInfo(
                  onPressed: () {},
                  title: 'Date of birth',
                  titValue: '5 Aug, 2000'),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                    onPressed: () => controller.deleteAccountWarningPopup(),
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
