import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_immi/features/shop_screens/shop_backend_controller/banner_model.dart';

import '../../utils/constants/dummy_data_models.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  /// upload local assets
  Future<Uint8List> getImagesDatafromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading images';
    }
  }

  /// upload image using imageData to firebase
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exeption: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Plateform Exeption: ${e.message}';
      } else {
        throw 'something went wrong';
      }
    }
  }

  /// upload image firebase
  Future<String> uploadImagefile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exeption: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Plateform Exeption: ${e.message}';
      } else {
        throw 'something went wrong';
      }
    }
  }

  Future<String> uploadBannerImage(String path, Uint8List image) async {
    try {
      final ref = _firebaseStorage.ref(path);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exeption: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Plateform Exeption: ${e.message}';
      } else {
        throw 'something went wrong';
      }
    }
  }

  final CollectionReference _bannersCollection =
      FirebaseFirestore.instance.collection('banners');

  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      // Loop through your banners and upload each one
      for (var banner in TDummyData.banners) {
        await _bannersCollection.add(banner.toJson());
      }
    } catch (e) {
      if (e is FirebaseException) {
        throw 'Firebase Exeption: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Plateform Exeption: ${e.message}';
      } else {
        throw 'something went wrong';
      }
    }
  }

}
