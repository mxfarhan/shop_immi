import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/update_name_controller.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/user_controller.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';

class ReVarifyToDeleteAccount extends StatelessWidget {
  const ReVarifyToDeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UserController());
    return Scaffold(
      appBar: TAppBar(
        backArrow: true,
        title: Text('Re-Authentication',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(height: TSizes.spaceBtwItems),
            Form(
                key:controller.reAuthFormkey,
                child:Column(
                  children: [
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: (value) => TValidator.validateEmptyText('Email',value),
                      decoration: const InputDecoration(
                        labelText: TTexts.email,
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.verifyPassword,
                      validator: (value) => TValidator.validateEmptyText('password',value),
                      decoration: const InputDecoration(
                        labelText: TTexts.password,
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwSections),

                    SizedBox(width: double.infinity,
                      child: ElevatedButton(onPressed:() =>controller.reAuthWithEmailandPassordUser(), child: Text('Delete! ')),
                    ),


                  ],
                ) )
          ],
        ),
      ),
    );
  }
}
