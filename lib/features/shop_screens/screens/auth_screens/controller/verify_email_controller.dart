import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shop_immi/data/repositories/auth_repository.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/varify_complete.dart';
import 'package:shop_immi/utils/popup/loaders.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent ', message: 'please check inbox to verify email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user=FirebaseAuth.instance.currentUser;
      if(user?.emailVerified??false ){
        timer.cancel();
        TLoaders.successSnackBar(title: 'Succeed Verified! ',message:'Your account have been verified' );
        Get.off(()=>  VarifiComplete(
          email: '',
          image: TImages.deliveredEmailIllustration,
          title: TTexts.yourAccountCreatedTitle,
          subtitle: TTexts.yourAccountCreatedSubTitle,
          btnText: TTexts.tContinue,
          onPressed: () =>AuthenticationRepository.instance.screenRedirect(),
        ),
        );

      }
    });
  }

  checkEmailVerificationStatus() async{
    final currentUser =FirebaseAuth.instance.currentUser;
    if(currentUser !=null && currentUser.emailVerified){
      TLoaders.successSnackBar(title: 'Succeed Verified! ',message:'Your account have been verified' );
      Get.off(()=>  VarifiComplete(email: '',
        image: TImages.deliveredEmailIllustration,
        title: TTexts.yourAccountCreatedTitle,
        subtitle: TTexts.yourAccountCreatedSubTitle,
        btnText: TTexts.tContinue,
        onPressed: () =>AuthenticationRepository.instance.screenRedirect(),
      ),
      );
    }
  }


}
