import 'brand_model.dart';

class ProductModel {
  String id;
  String? sku;
  int stock;
  String title;
  double price;
  double salrPrice;
  DateTime? date;
  String thumbnil;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categories;
  List<String>? image;
  String productType;
  // List<ProductAttributeModel>? productAttribute;
  // List<ProductVariationeModel>? productVariation;

  ProductModel({
    required this.id,
    this.sku,
    required this.stock,
    required this.title,
    required this.price,
    this.salrPrice=0.0,
    this.date,
    required this.thumbnil,
    this.isFeatured,
    this.brand,
    this.description,
    this.categories,
    this.image,
    required this.productType,
    // this.productAttribute,
    // this.productVariation,
  });
}
