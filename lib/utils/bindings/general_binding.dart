import 'package:get/get.dart';
import 'package:shop_immi/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}