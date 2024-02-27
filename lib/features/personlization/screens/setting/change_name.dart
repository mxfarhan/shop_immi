import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/update_name_controller.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/user_controller.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(updateNameController());
    return Scaffold(
      appBar: TAppBar(
        backArrow: true,
        title: Text('Change Name',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text('Use real name for easy varification',
                style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: TSizes.spaceBtwItems),
            Form(
                key:controller.updateUserKey,
                child:Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => TValidator.validateEmptyText('First name ',value),
                      decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => TValidator.validateEmptyText('Last name ',value),
                      decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwSections),

                    SizedBox(width: double.infinity,
                      child: ElevatedButton(onPressed:() =>controller.updateUserName(), child: const Text('Save')),
                    ),


                  ],
                ) )
          ],
        ),
      ),
    );
  }
}
