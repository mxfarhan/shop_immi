import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256',style: Theme.of(context).textTheme.bodyMedium),
          ],),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping fee',style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6',style: Theme.of(context).textTheme.labelLarge),
          ],),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax fee',style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6',style: Theme.of(context).textTheme.labelLarge),
          ],),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total',style: Theme.of(context).textTheme.bodyMedium),
            Text('\$277',style: Theme.of(context).textTheme.titleMedium),
          ],),
      ],
    );
  }
}
