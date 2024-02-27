import 'package:flutter/material.dart';
import 'package:shop_immi/common/styles/spacing_style.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/controller/forget_password_controller.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class VarifiComplete extends StatelessWidget {
  const VarifiComplete(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed,
      required this.btnText,
      required this.email,
      this.show2ndbtn=false
      });

  final String image, title, subtitle, btnText, email;
  final VoidCallback onPressed;
  final bool? show2ndbtn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight *1.5,
          child: Column(
            children: [
              Image(
                  //Lottie.asset(image,width:MediaQ......*0.6)
                  width: THelperFunctions.screenWidth() * 0.6,
                  image: AssetImage(
                    image,
                  )),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed: onPressed, child: Text(btnText)),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              show2ndbtn!?SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(onPressed:()=>ForgetPasswordController.instance.resendPasswordResetEmail(email) , child: Text('Resend Email')),
              ):SizedBox(height: 0,width: 0),
            ],
          ),
        ),
      ),
    );
  }
}
