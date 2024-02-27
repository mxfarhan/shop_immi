import 'package:flutter/material.dart';
import 'package:shop_immi/common/styles/spacing_style.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../widgets/login_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TLoginHeader(dark: dark),
              const LoginForms(),
              const TDeviderWidget(text: 'Or Sign In with'),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSocialBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
