
class CartModel {
  final int id;
  final int productId;
  final String product;
  final int count;
  final int price;
  final int discount;
  final int discountPrice;
  final String image;

  bool deleteloading = false;
  bool countloading =false;
  CartModel({
   required this.id,
    required this.productId,
    required this.product,
    required this.count,
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.image,

     this.deleteloading = false,
     this.countloading =false
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
  
    return CartModel(
      id: json['id'], 
      productId:json['product_id'], 
      product: json['product'], 
      count: json['count'] , 
      price: json['price'], 
      discount:json['discount'] , 
      discountPrice:json['discount_price'] , 
      image:json['image']  ,

    
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String,dynamic> data = <String,dynamic>{};
    data['id'] = id ;
    data['product_id'] = productId;
    data['product'] = product ;
    data['count'] = count ;
    data['price'] = price ;
    data['discount'] = discount;
    data['discount_price'] = discountPrice;
    data['image'] = image;

    return data;
  }
}

class UserCart {
List<CartModel> cartList;
  final int cartTotalPrice;
  final int totalWithoutDiscountPrice;

UserCart({
  required this.cartList,
  required this.cartTotalPrice,
  required this.totalWithoutDiscountPrice
});


factory UserCart.fromJson (Map<String,dynamic>json){
  List<dynamic> userCartJson = json['user_cart'];
  List<CartModel> cartList = userCartJson.map((element)=>
  CartModel.fromJson(element)).toList();
  return UserCart(cartList: cartList, 
  cartTotalPrice: json["cart_total_price"], 
  totalWithoutDiscountPrice: json["total_without_discount_price"]);
}

}