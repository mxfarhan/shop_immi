import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shop_immi/utils/constants/sizes.dart';
import 'package:shop_immi/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../controllers/onboarding_contoller.dart';


                                     //Skip Button

class skipOnBoard extends StatelessWidget {
  const skipOnBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: ()=>OnBoardingContoller.instance.skipPage(),
          child: const Text('Skip'),
        ));
  }
}
//................................//..........//////..........................//
                                      // Pages

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Image(
              width: THelperFunctions.screenWidth() * 0.8,
              height: THelperFunctions.screenHeight() * 0.6,
              image: AssetImage(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
//....................................................................//
                                 // DOTS

class dotsOnBoard extends StatelessWidget {
  const dotsOnBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=OnBoardingContoller.instance;

    final dark=THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
            activeDotColor: dark? TColors.light :TColors.dark, dotHeight: 6),
      ),
    );
  }
}
//....................................................................//
                  //      NAVIGATION NEXT BUTTON


class NavBtnOnboard extends StatelessWidget {
  const NavBtnOnboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () =>OnBoardingContoller.instance.nextPage(),
          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
