import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/common/rounded_container.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/varify_complete.dart';
import 'package:shop_immi/features/shop_screens/screens/cart/cart_item_widget.dart';
import 'package:shop_immi/features/shop_screens/screens/checkout/billing_address_widget.dart';
import 'package:shop_immi/features/shop_screens/screens/checkout/billing_amount_section_sub.dart';
import 'package:shop_immi/features/shop_screens/screens/checkout/billing_payment_widget.dart';
import 'package:shop_immi/navigation_bar.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/productcard/coupon_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        backArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItems(showAddRemoveBtn: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              //coupon
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                borderColor: TColors.grey,
                padding: const EdgeInsets.all(TSizes.md),
                bgColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    TBillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() =>  VarifiComplete(
              email: '',
                image: TImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subtitle: 'Your Item will ship soon',
                onPressed: ()=>Get.to(()=>const NavigationMenu()),
                btnText: 'Go Home')),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}
