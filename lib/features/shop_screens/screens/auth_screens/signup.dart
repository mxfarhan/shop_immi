import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/constants/text_strings.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../widgets/login_widgets.dart';
import '../../widgets/signup_widgets.dart';


class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const SignupFormWidget(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TDeviderWidget(text: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSocialBtn(),
            ],
          ),
        ),
      ),
    );
  }
}