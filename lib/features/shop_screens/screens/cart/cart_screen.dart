import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_immi/common/widgets/custom_appBar.dart';
import 'package:shop_immi/features/shop_screens/screens/cart/cart_item_widget.dart';
import 'package:shop_immi/features/shop_screens/screens/checkout/checkout_screen.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        backArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: ()=>Get.to(()=>const CheckoutScreen()),
            child: const Text('Checkout \$256')),
      ),
    );
  }
}