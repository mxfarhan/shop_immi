import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/user_controller.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/helpers/network_manager.dart';
import 'package:shop_immi/utils/popup/full_screen_loader.dart';
import 'package:shop_immi/utils/popup/loaders.dart';

import '../../../../../data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormkey = GlobalKey<FormState>();


  @override
  void onInit() {
    email.text=localStorage.read('REMEMBER_ME_EMAIL');
    password.text=localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();


  }

  Future<void> emailAndPasswordSignIn() async {
    try {


      TFullScreenLoader.openLoadingDialog(
          'Logging You in', TImages.LoadeLlotie);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (!loginFormkey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      final userCrendial = await AuthenticationRepository.instance
          .loginWIthEmailandPassword(email.text.trim(), password.text.trim());
      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'OH Snap', message: e.toString());
    }
  }

  /// Google Authentication
  Future<void> googleSignIn() async{
    try{
      TFullScreenLoader.openLoadingDialog('Wait till Google Sign In',TImages.LoadeLlotie );

      //check internet cnction
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      // Google Athentication
      final userCredential=await AuthenticationRepository.instance.singinWithGoogle();

      //Saave user record
      await UserController().saveUserRecord(userCredential);


      TFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();



    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'No Connection',message: e.toString());
    }

  }


}
