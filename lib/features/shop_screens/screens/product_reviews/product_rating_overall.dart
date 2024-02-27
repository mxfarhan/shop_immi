import 'package:flutter/material.dart';
import 'package:shop_immi/features/shop_screens/screens/product_reviews/progress_indicator_widget.dart';

class TProductRatingOverall extends StatelessWidget {
  const TProductRatingOverall({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text('4.5', style: Theme.of(context).textTheme.displayLarge)),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: '5',value: 1),
              TRatingProgressIndicator(text: '4',value: 0.8),
              TRatingProgressIndicator(text: '3',value: 0.6),
              TRatingProgressIndicator(text: '2',value: 0.4),
              TRatingProgressIndicator(text: '1',value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}
