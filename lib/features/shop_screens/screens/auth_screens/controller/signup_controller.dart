import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/data/repositories/auth_repository.dart';
import 'package:shop_immi/data/repositories/user_repository.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/varify_email.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/popup/full_screen_loader.dart';
import 'package:shop_immi/utils/popup/loaders.dart';
import 'package:shop_immi/utils/usermodel/user_model.dart';

import '../../../../../utils/helpers/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final username = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      //loaderr
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.LoadeLlotie);

      //internet connection check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
         TFullScreenLoader.stopLoading();
        return;
      }
      if (!signupFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;}

      //privacyPolicy chk
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoading();
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policies',
            message: 'In order to create account Privacy Policy must accept');
        return;
      }
      // Rigister user in firebase
      final userCrendial = await AuthenticationRepository.instance
          .registerWithEmailandPassword(
              email.text.trim(), password.text.trim());

      //saving user data
      final newUser = UserModel(
        id: userCrendial.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profile: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      Get.to(()=>VarifyEmailScreen(email: email.text.trim()));
      TLoaders.successSnackBar(
          title: 'Congrats', message: 'account created! Proceed to verify');


    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap1', message: e.toString());
    }
    // finally {
    //   TFullScreenLoader.stopLoading();
    // }
  }
}
