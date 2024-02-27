import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shop_immi/data/repositories/firebase_storage_service.dart';
import 'package:shop_immi/features/shop_screens/shop_backend_controller/banner_model.dart';
import 'package:shop_immi/features/shop_screens/shop_backend_controller/category_model.dart';
import 'package:shop_immi/utils/popup/loaders.dart';

import '../../utils/exceptions/firebase_exceptions.dart';
import '../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }


  /////////////////////////uploadinggggggg-----------


  /// Get sub categories
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage=Get.put(TFirebaseStorageService());
      //logo through each category
      for (var category in categories){
        //get image link from local asset
        final file=await storage.getImagesDatafromAssets(category.image);
        final url=await storage.uploadImageData('categories',file,category.name);

        category.image=url;
        await _db.collection("categories").doc(category.id).set(category.toJson());
        TLoaders.successSnackBar(title: 'Uploaded Dummy data');
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

                   /// banners uplaod

  Future<void> uploadBanner(List<BannerModel> banners) async {
    try {
      final storage=Get.put(TFirebaseStorageService());
      //logo through each
      for (var banner in banners){
        //get image link from local asset
        final file=await storage.getImagesDatafromAssets(banner.imageUrl);
       final url= await storage.uploadBannerImage('banners',file);

       banner.imageUrl=url;



        await _db.collection("banners").doc().set(banner.toJson());
        TLoaders.successSnackBar(title: 'Uploaded Dummy data');
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  /// Upload Categories to Firestore
 
}
