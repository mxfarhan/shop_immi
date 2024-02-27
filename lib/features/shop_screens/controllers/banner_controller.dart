import 'package:get/get.dart';
import 'package:shop_immi/data/repositories/banner_repository.dart';
import 'package:shop_immi/features/shop_screens/shop_backend_controller/banner_model.dart';

import '../../../utils/popup/loaders.dart';

class BannerController extends GetxController{
  static BannerController get instance=>Get.find();


  final carousalCurrentIndex=0.obs;
  final isLoading = false.obs;

  RxList<BannerModel> banners = <BannerModel>[].obs;
  //RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  void updatePageIndicator(index){
    carousalCurrentIndex.value=index;}

  @override
  void onInit() {
    fatchBanners();
    super.onInit();
  }

  /// fetch banner
  /// --load banners data
  Future<void> fatchBanners() async {
    try {
      //show loader
      isLoading.value = true;

      // fetch banner
      final bannersRepo = Get.put(BannerRepository());
      final banners=await bannersRepo.fetchBanner();

      //assign banners
      this.banners.assignAll(banners);

    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh hani', message: e.toString());
    } finally {
      isLoading.value=false;
    }
  }
}