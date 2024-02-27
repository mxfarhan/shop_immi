import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  Map<String,dynamic> toJson(){
    return{
      'ImageUrl':imageUrl,
      'TargetScreen':targetScreen,
      'Active':active,
    };
  }
static BannerModel empty()=>BannerModel(imageUrl: '', targetScreen: '', active:false);
  /// document snapshot
  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return BannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false,
      );
    }else{
      return BannerModel.empty();
    }

    }
  }
