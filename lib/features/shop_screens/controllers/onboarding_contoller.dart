import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../screens/auth_screens/login.dart';

class OnBoardingContoller extends GetxController{
  static OnBoardingContoller get instance=>Get.find();

  final pageController=PageController();
  Rx<int> currentPageIndex=0.obs;

  void updatePageIndicator(index)=>currentPageIndex.value=index;



  void dotNavigationClick(index)  {
    currentPageIndex.value=index;
    pageController.jumpTo(index);
  }

  void nextPage()  {
    if (currentPageIndex.value==2){
      final storage=GetStorage();

      // if(kDebugMode){
      //   print('get nexxxxxxxxxxxxttt');
      //   print( storage.read('isFirstTime'));
      // }

      storage.write('isFirstTime', false);
      Get.offAll(const LoginScreen());
    }else{
      int page=currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage()  {
   Get.offAll(LoginScreen());
  }


}