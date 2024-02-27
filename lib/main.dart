import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_immi/routes/routes.dart';
import 'package:shop_immi/utils/bindings/general_binding.dart';
import 'package:shop_immi/utils/constants/colors.dart';
import 'data/repositories/auth_repository.dart';
import 'firebase_options.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/onboarding.dart';
import 'package:shop_immi/utils/theme/theme.dart';

import 'features/shop_screens/screens/auth_screens/login.dart';

Future<void> main() async {
  //widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //init local storage
  await GetStorage.init();
  
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // waiting of splash screen

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const App());
}

//main
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding:GeneralBindings() ,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        getPages: AppRoutes.pages,
        home: const Scaffold(
          backgroundColor: TColors.primary,
          body: Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        )
        //const OnBoardingScreen(),
        // LoginScreen()
        );
  }
}
