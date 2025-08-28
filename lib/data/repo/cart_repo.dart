import 'package:di_state_managment/data/conf/remote_confige.dart';
import 'package:di_state_managment/data/models/cart_model.dart';
import 'package:di_state_managment/data/source/cart_data_src.dart';
import 'package:flutter/material.dart';

abstract class ICartRepository {
  Future<UserCart> getUserCart();
  Future<UserCart> addToCart({required int productId});
  Future<UserCart> removeFromCart({required int productId});
  Future<UserCart> deleteFromCart({required int productId});
  Future<int> cartCountItems();
  Future<String> payCart();
}

class CartRepo implements ICartRepository {
  final ICartDataSource _cartDataSource;
  ValueNotifier<int> cartCount = ValueNotifier(0);

  CartRepo(this._cartDataSource);

  @override
  Future<UserCart> addToCart({required int productId}) =>
      _cartDataSource.addToCart(productId: productId).then((value) {
        cartCount.value = value.cartList.length ;
        return value;
      });

  @override
  Future<UserCart> deleteFromCart({required int productId}) =>
      _cartDataSource.deleteFromCart(productId: productId).then((value) {
        cartCount.value = value.cartList.length ;
        return value;
      });

  @override
  Future<UserCart> getUserCart() => _cartDataSource.getUserCart().then((value){
    cartCount.value = value.cartList.length;
    return value;
  });

  @override
  Future<UserCart> removeFromCart({required int productId}) =>
      _cartDataSource.removeFromCart(productId: productId).then(
        (value){
            cartCount.value = value.cartList.length;
            return value;
      });

  @override
  Future<int> cartCountItems() =>
      _cartDataSource.cartCountItems().then((value) => cartCount.value = value);
      
  @override
  Future<String> payCart()=>_cartDataSource.payCart();
    
        
}
final cartRepository = CartRepo(CartRemoteDataSrc(DioManager.dio));