import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/login.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/varify_complete.dart';import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/constants/text_strings.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return VarifiComplete(
      email: '',
        image: TImages.deliveredInPlaneIllustration,
        title: TTexts.changeYourPasswordTitle,
        subtitle: TTexts.changeYourPasswordSubTitle,
        btnText: TTexts.done,
        onPressed: ()=>Get.to(()=>const LoginScreen()),
    );
  }
}
