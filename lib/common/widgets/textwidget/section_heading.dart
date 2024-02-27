import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.title,
    this.btnTitle='View all',
    this.onPressed,
    this.showActionBtn=true,
    this.textColor,
  });

  final String title, btnTitle;
  final void Function()? onPressed;
  final bool showActionBtn;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionBtn)
          TextButton(onPressed: onPressed, child: Text(btnTitle)),
      ],
    );
  }
}