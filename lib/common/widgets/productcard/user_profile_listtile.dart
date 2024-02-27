import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../circle_image_store.dart';

class TUserProLTile extends StatelessWidget {
  const TUserProLTile({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;
    return ListTile(
      leading: const TCircleImage(
          image: TImages.userr, width: 50, height: 50, padding: 0),
      title: Text(controller.user.value.fullNameCapital,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: TColors.white)),
      subtitle: Text(controller.user.value.email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: TColors.white)),
      trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Iconsax.edit,
            color: TColors.white,
          )),
    );
  }
}