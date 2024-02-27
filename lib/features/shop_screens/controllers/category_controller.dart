import 'package:get/get.dart';
import 'package:shop_immi/data/repositories/category_repository.dart';
import 'package:shop_immi/features/shop_screens/shop_backend_controller/category_model.dart';
import 'package:shop_immi/utils/popup/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();

    super.onInit();
  }

  /// --load category data
  Future<void> fetchCategories() async {
    try {
      //show loader
      isLoading.value = true;

      // fetch category
      final categories = await _categoryRepository.getAllCategories();

      //update category
      allCategories.assignAll(categories);

      // filter featured category
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh hani', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// --load selected category data

  /// -get category to sub category
}
