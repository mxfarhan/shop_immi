import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/device/device_utility.dart';
//////////////////APP Barr
class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
        this.title,
        this.backArrow = false,
        this.leadingIcon,
        this.actions,
        this.loadingOnPress,
        this.backword=false});

  final Widget? title;
  final bool backArrow;
  final bool backword;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? loadingOnPress;

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: backArrow,
        leading: backArrow
            ? IconButton(
            onPressed: () =>Get.back(), icon: Icon(Iconsax.arrow_left_34,color: dark?TColors.white:TColors.black,))
            : leadingIcon!=null? IconButton(onPressed: loadingOnPress, icon: Icon(leadingIcon)):null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());    //preferred size widgets
}
