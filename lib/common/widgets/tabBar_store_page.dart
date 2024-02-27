import 'package:flutter/material.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../utils/device/device_utility.dart';
//////////////////APP Barr
class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);
    return Material(
      color: dark?TColors.black:TColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor: dark?TColors.white:TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
