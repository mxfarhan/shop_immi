import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop_immi/data/repositories/user_repository.dart';
import 'package:shop_immi/features/personlization/screens/profile_screen.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/user_controller.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/popup/full_screen_loader.dart';
import 'package:shop_immi/utils/popup/loaders.dart';

import '../../../../../data/repositories/auth_repository.dart';
import '../../../../../utils/helpers/network_manager.dart';

class updateNameController extends GetxController {
  static updateNameController get instance => Get.find();

  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading Information', TImages.LoadeLlotie);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'firstName': firstName.text.trim(),
        'lastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);
      //update Rx User value\
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
      TLoaders.successSnackBar(title: 'Name Changed! ', message: 'Congrats your name had been updated');

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh hani', message: e.toString());
    }
  }
}
