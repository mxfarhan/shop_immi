import 'package:get/get.dart';
import 'package:shop_immi/features/personlization/screens/profile_screen.dart';
import 'package:shop_immi/features/personlization/screens/setting/setting_screen.dart';
import 'package:shop_immi/features/shop_screens/screens/auth_screens/login.dart';
import 'package:shop_immi/features/shop_screens/screens/cart/cart_screen.dart';
import 'package:shop_immi/features/shop_screens/screens/checkout/checkout_screen.dart';
import 'package:shop_immi/features/shop_screens/screens/favouites/favouite_screen.dart';
import 'package:shop_immi/features/shop_screens/screens/home/home.dart';
import 'package:shop_immi/features/shop_screens/screens/store/store.dart';

class TRoutes{
  static const home='/';
  static const store='/store';
  static const favourite='/favourite';
  static const setting='/settings';
  static const signIn='/signIn';
  static const search='/search';
  static const order='/order';
  static const cart='/cart';
  static const checkout='/checkout';

}
class AppRoutes{
  static final pages=[
    GetPage(name: TRoutes.home, page: ()=>const HomeScreen()),
    GetPage(name: TRoutes.store, page: ()=>const Store()),
    GetPage(name: TRoutes.favourite, page: ()=>const FavouriteScreen()),
    GetPage(name: TRoutes.setting, page: ()=>const SettingScreen()),
    GetPage(name: TRoutes.signIn, page: ()=>const LoginScreen()),
    GetPage(name: TRoutes.order, page: ()=>const ProfileScreen()),
    GetPage(name: TRoutes.cart, page: ()=>const CartScreen()),
    GetPage(name: TRoutes.checkout, page: ()=>const CheckoutScreen()),
  ];
}