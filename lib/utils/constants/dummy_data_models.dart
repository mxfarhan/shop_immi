import 'package:shop_immi/features/shop_screens/shop_backend_controller/banner_model.dart';
import 'package:shop_immi/routes/routes.dart';
import 'package:shop_immi/utils/constants/image_strings.dart';

import '../../features/shop_screens/shop_backend_controller/category_model.dart';

class TDummyData{
  static final List<CategoryModel> categories=[
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electric', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Cloths', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetic', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelry', image: TImages.jeweleryIcon, isFeatured: true),

    // sub
    CategoryModel(id: '8', name: 'Sports Shoes', image: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel(id: '9', name: 'Track Suit', image: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel(id: '10', name: 'Cricket', image: TImages.sportIcon, isFeatured: false,parentId: '1'),

    //

    CategoryModel(id: '11', name: 'Bedroom Furniture', image: TImages.furnitureIcon, isFeatured: false,parentId: '5'),
    CategoryModel(id: '12', name: 'Kichen Furniture', image: TImages.furnitureIcon, isFeatured: false,parentId: '5'),
    CategoryModel(id: '13', name: 'Office Furniture', image: TImages.furnitureIcon, isFeatured: false,parentId: '5'),
//
    CategoryModel(id: '15', name: 'Mobiles', image: TImages.electronicsIcon, isFeatured: false,parentId: '2'),
    CategoryModel(id: '16', name: 'Laptops', image: TImages.electronicsIcon, isFeatured: false,parentId: '2'),
    CategoryModel(id: '17', name: 'Cars', image: TImages.electronicsIcon, isFeatured: false,parentId: '2'),

    CategoryModel(id: '18', name: 'child Cloths', image: TImages.clothIcon, isFeatured: false,parentId: '3'),
    CategoryModel(id: '19', name: 'Women Cloths', image: TImages.clothIcon, isFeatured: false,parentId: '3'),
    CategoryModel(id: '20', name: 'Casual Cloths', image: TImages.clothIcon, isFeatured: false,parentId: '3'),

    CategoryModel(id: '21', name: 'Animals Meds', image: TImages.animalIcon, isFeatured: false,parentId: '4'),
    CategoryModel(id: '22', name: 'Cat', image: TImages.animalIcon, isFeatured: false,parentId: '4'),
    CategoryModel(id: '23', name: 'Care Doctor', image: TImages.animalIcon, isFeatured: false,parentId: '4'),

    CategoryModel(id: '24', name: 'Shoes', image: TImages.shoeIcon, isFeatured: false,parentId: '6'),


  ];

  static final List<BannerModel> banners=[
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.checkout, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.favourite, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.store, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.order, active: true),
    ];
}