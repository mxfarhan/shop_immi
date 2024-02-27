import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_immi/common/widgets/productcard/shimmer_loader.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';

class TCircleImage extends StatelessWidget {
  const TCircleImage({
    super.key,
    this.padding = TSizes.sm,
    this.width = 56,
    this.height = 56,
    required this.image,
    this.fit,
    this.border,
    this.bgColor,
    this.overlayColor,
    this.isNetworkImg = false,
  });

  final double padding, width, height;
  final String image;
  final BoxFit? fit;
  final BoxBorder? border;
  final Color? bgColor;
  final Color? overlayColor;
  final bool isNetworkImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: bgColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
            child: isNetworkImg
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const TShimmerLoader(width: 55, height: 55),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    color: overlayColor,
                    image: isNetworkImg
                        ? NetworkImage(image)
                        : AssetImage(image) as ImageProvider)),
      ),
    );
  }
}
