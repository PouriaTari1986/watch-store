import 'package:di_state_managment/data/conf/remote_confige.dart';
import 'package:di_state_managment/data/models/cart_model.dart';
import 'package:di_state_managment/data/source/cart_data_src.dart';
import 'package:flutter/material.dart';

abstract class ICartRepository {
  Future<CartModel> getUserCart();
  Future<CartModel> addToCart({required int productId});
  Future<CartModel> removeFromCart({required int productId});
  Future<CartModel> deleteFromCart({required int productId});
  Future<int> cartCountItems();
}

class CartRepo implements ICartRepository {
  final ICartDataSource _cartDataSource;
  ValueNotifier<int> cartCount = ValueNotifier(0);

  CartRepo(this._cartDataSource);

  @override
  Future<CartModel> addToCart({required int productId}) =>
      _cartDataSource.addToCart(productId: productId).then((value) {
        cartCount.value = value.userCart?.length ?? 0;
        return value;
      });

  @override
  Future<CartModel> deleteFromCart({required int productId}) =>
      _cartDataSource.deleteFromCart(productId: productId).then((value) {
        cartCount.value = value.userCart?.length ?? 0;
        return value;
      });

  @override
  Future<CartModel> getUserCart() => _cartDataSource.getUserCart();

  @override
  Future<CartModel> removeFromCart({required int productId}) =>
      _cartDataSource.removeFromCart(productId: productId);

  @override
  Future<int> cartCountItems() =>
      _cartDataSource.cartCountItems().then((value) => cartCount.value = value);
}
final cartRepository = CartRepo(CartRemoteDataSrc(DioManager.dio));