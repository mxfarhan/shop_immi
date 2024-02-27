import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_immi/common/widgets/productcard/shimmer_loader.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/user_controller.dart';
import 'package:shop_immi/features/shop_screens/screens/cart/cart_screen.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import '../../../common/widgets/cart_couter_home.dart';
import '../../../common/widgets/custom_appBar.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';



//////////////////////////////    this Home appbar

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(
            (){
              if(controller.profileLoading.value){
                return const TShimmerLoader(width: 170, height:25);
              }else{
                return Padding(
                  padding: const EdgeInsets.only(top: TSizes.spaceBtwItems/2),
                  child: Text(
                    controller.user.value.fullNameCapital,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: TColors.white),
                  ),
                );
              }

            }),
        ],
      ),
      actions: [
        TCartCounter(onPressed: () =>Get.to(()=>const CartScreen()), iconColor: TColors.white),
      ],
    );
  }
}
