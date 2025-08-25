import 'package:di_state_managment/data/models/banner.dart';
import 'package:di_state_managment/data/models/category.dart';
import 'package:di_state_managment/data/models/product.dart';
import 'package:di_state_managment/data/models/slide.dart';

class Home {
    List<SliderModel> sliders;
    List<CategoryModel> categories;
    List<Product> amazingProducts;
    BannerModel banner;
    List<Product> mostSellerProducts;
    List<Product> newextProducts;

  Home({
    required this.sliders,
    required this.categories,
    required this.amazingProducts,
    required this.banner,
    required this.mostSellerProducts,
    required this.newextProducts,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      sliders: (json['sliders'] as List<dynamic>)
          .map((e) => SliderModel.fromJson(e))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
      amazingProducts: (json['amazing_products'] as List<dynamic>)
          .map((e) => Product.fromJson(e))
          .toList(),
      banner: BannerModel.fromJson(json['banner']),
      mostSellerProducts: (json['most_seller_products'] as List<dynamic>)
          .map((e) => Product.fromJson(e))
          .toList(),
      newextProducts: (json['newest_products'] as List<dynamic>)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }
}
