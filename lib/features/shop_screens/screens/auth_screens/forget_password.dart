import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/forget_password_controller.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/user_controller.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/reseting_password.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/constants/text_strings.dart';
import 'package:shop_immi/utils/validators/validation.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Text(TTexts.forgetPassword,style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            Text(TTexts.yourAccountCreatedSubTitle,style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections * 2,),

            Form(
              key: controller.forgetPasswordKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(labelText: TTexts.email,prefixIcon:Icon(Iconsax.direct_right), ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections ),
            SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: const Text(TTexts.submit)))

          ],
        ),
      ),
    );
  }
}
