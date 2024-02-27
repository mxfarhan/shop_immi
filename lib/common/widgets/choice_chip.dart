import 'package:flutter/material.dart';
import 'package:shop_immi/features/shop_screens/widgets/home_scree_widgets.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';

import '../../utils/constants/colors.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final getcolor = THelperFunctions.getColor(text);
    return ChoiceChip(
      label: getcolor != null ? const SizedBox() : Text(text),
      selected: selected,
      labelStyle: TextStyle(color: selected ? TColors.white : null),
      onSelected: onSelected,
      shape:getcolor != null ? const CircleBorder():null,
      backgroundColor:getcolor != null ?THelperFunctions.getColor(text)! :null,
      labelPadding: getcolor != null ?const EdgeInsets.all(0):null,
      padding: getcolor != null ?const EdgeInsets.all(0):null,
      avatar: getcolor != null
          ? TCircleDesign(
              width: 50, height: 50, bgcolor: THelperFunctions.getColor(text)!)
          : null,
    );
  }
}
