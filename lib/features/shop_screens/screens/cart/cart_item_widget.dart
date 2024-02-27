import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/cart_single_item.dart';

import '../../../../common/widgets/productcard/product_quantity_changer.dart';
import '../../../../utils/constants/sizes.dart';
import '../product_detail/product_detail_widgets.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, this.showAddRemoveBtn=true,
  });
  final bool showAddRemoveBtn;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) =>   Column(
        children: [
          const TCartItemSingle(),
          if(showAddRemoveBtn) const SizedBox(height: TSizes.spaceBtwItems),
          if(showAddRemoveBtn)
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70),
                  TProductQuantityWithAddRemove(),
                ],
              ),
              TProductPriceText(price: '250'),
            ],
          ),
        ],
      ),
    );
  }
}
