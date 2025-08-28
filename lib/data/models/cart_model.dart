class CartModel {
  List<UserCart>? userCart;
  int? cartTotalPrice;
  int? totalWithoutDiscountPrice;
  bool countloading =false;
  bool deleteloading =false;
  CartModel(
      {this.userCart, 
      this.cartTotalPrice, 
      this.totalWithoutDiscountPrice,
      this.countloading = false,
      this.deleteloading = false
      });

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['user_cart'] != null) {
      userCart = <UserCart>[];
      json['user_cart'].forEach((v) {
        userCart!.add( UserCart.fromJson(v));
      });
    }
    cartTotalPrice = json['cart_total_price'];
    totalWithoutDiscountPrice = json['total_without_discount_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (userCart != null) {
      data['user_cart'] = userCart!.map((v) => v.toJson()).toList();
    }
    data['cart_total_price'] = cartTotalPrice;
    data['total_without_discount_price'] = totalWithoutDiscountPrice;
    return data;
  }
}

class UserCart {
  int? id;
  int? productId;
  String? product;
  int? count;

  UserCart({this.id, this.productId, this.product, this.count});

  UserCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    product = json['product'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product'] = product;
    data['count'] = count;
    return data;
  }
}