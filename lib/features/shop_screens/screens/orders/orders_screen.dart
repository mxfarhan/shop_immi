import 'package:flutter/material.dart';
import 'package:shop_immi/features/shop_screens/screens/orders/order_list_widget.dart';
import 'package:shop_immi/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_appBar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        backArrow: true,
        title:
            Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderListItems(),
      ),
    );
  }
}
