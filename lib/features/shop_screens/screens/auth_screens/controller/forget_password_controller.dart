import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/data/repositories/auth_repository.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/login.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/varify_complete.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/popup/full_screen_loader.dart';
import 'package:shop_immi/utils/popup/loaders.dart';

import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  /// send reset password email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', TImages.LoadeLlotie);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPasswordKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Email link sent to Reset your Password'.tr);

      Get.to(() =>
          VarifiComplete(
            email: email.text.trim(),
            image: TImages.deliveredEmailIllustration,
            title: TTexts.changeYourPasswordTitle,
            subtitle: TTexts.changeYourPasswordSubTitle,
            btnText: TTexts.tContinue,
            show2ndbtn: true,
            onPressed: () =>Get.offAll(()=>const LoginScreen()),
          ));
      } catch (e)
      {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title:'Oh snap',message: e.toString());
      }
    }


    /// Re-Send Email again

  resendPasswordResetEmail(String email) async {

    try {
      TFullScreenLoader.openLoadingDialog(
          'Processing your request', TImages.LoadeLlotie);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Email sent again',
          message: 'Email link sent again to Reset your Password'.tr);
    } catch (e)
    {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title:'Oh snap',message: e.toString());
    }
  }
}
