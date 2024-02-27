import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String image;
  String id;
  String name;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productCount});

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productCount,
      'IsFeatured': isFeatured,
    };
  }

  static BrandModel empty() =>BrandModel(id: '', image: '', name: '' );

  /// document snapshot
  factory BrandModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BrandModel(
          id:  data['Id'] ?? '',
          image:  data['Image'] ?? '',
          name:  data['Name'] ?? '',
          productCount:  data['ProductsCount'] ?? '',
        isFeatured:  data['IsFeatured'] ?? false,
            );
    } else {
      return BrandModel.empty();
    }
  }
}
