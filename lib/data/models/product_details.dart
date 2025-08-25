
import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String titleEn;
  final int price;
  final int discount;
  final int discountPrice;
  final String guaranty;
  final int productCount;
  final String category;
  final int categoryId;
  final List<ProductColor> colors;
  final String brand;
  final int brandId;
  final int review;
  final String image;
  final List<ProductProperty> properties;
  final String description;
  final String discussion;
  final List<ProductComment> comments;

  Product({
    required this.id,
    required this.title,
    required this.titleEn,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.guaranty,
    required this.productCount,
    required this.category,
    required this.categoryId,
    required this.colors,
    required this.brand,
    required this.brandId,
    required this.review,
    required this.image,
    required this.properties,
    required this.description,
    required this.discussion,
    required this.comments,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      titleEn: map['title_en'] ?? '',
      price: map['price'] ?? 0,
      discount: map['discount'] ?? 0,
      discountPrice: map['discount_price'] ?? 0,
      guaranty: map['guaranty'] ?? '',
      productCount: map['product_count'] ?? 0,
      category: map['category'] ?? '',
      categoryId: map['category_id'] ?? 0,
      colors: List<ProductColor>.from(
        (map['colors'] as List<dynamic>? ?? [])
            .map((e) => ProductColor.fromMap(e)),
      ),
      brand: map['brand'] ?? '',
      brandId: map['brand_id'] ?? 0,
      review: map['review'] ?? 0,
      image: map['image'] ?? '',
      properties: List<ProductProperty>.from(
        (map['properties'] as List<dynamic>? ?? [])
            .map((e) => ProductProperty.fromMap(e)),
      ),
      description: map['description'] ?? '',
      discussion: map['discussion'] ?? '',
      comments: List<ProductComment>.from(
        (map['comments'] as List<dynamic>? ?? [])
            .map((e) => ProductComment.fromMap(e)),
      ),
    );
  }

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'title_en': titleEn,
      'price': price,
      'discount': discount,
      'discount_price': discountPrice,
      'guaranty': guaranty,
      'product_count': productCount,
      'category': category,
      'category_id': categoryId,
      'colors': colors.map((e) => e.toMap()).toList(),
      'brand': brand,
      'brand_id': brandId,
      'review': review,
      'image': image,
      'properties': properties.map((e) => e.toMap()).toList(),
      'description': description,
      'discussion': discussion,
      'comments': comments.map((e) => e.toMap()).toList(),
    };
  }
}

class ProductColor {
  final String title;
  final String code;

  ProductColor({required this.title, required this.code});

  factory ProductColor.fromMap(Map<String, dynamic> map) {
    return ProductColor(
      title: map['title'] ?? '',
      code: map['code'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'code': code,
    };
  }
}

class ProductProperty {
  final String property;
  final String value;

  ProductProperty({required this.property, required this.value});

  factory ProductProperty.fromMap(Map<String, dynamic> map) {
    return ProductProperty(
      property: map['property'] ?? '',
      value: map['value'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'property': property,
      'value': value,
    };
  }
}

class ProductComment {
  final String user;
  final String body;

  ProductComment({required this.user, required this.body});

  factory ProductComment.fromMap(Map<String, dynamic> map) {
    return ProductComment(
      user: map['user'] ?? '',
      body: map['body'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'body': body,
    };
  }
}
