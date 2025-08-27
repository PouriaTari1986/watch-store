import 'package:di_state_managment/data/models/cart_model.dart';
import 'package:di_state_managment/data/source/constant.dart';
import 'package:di_state_managment/utils/response_validator.dart';
import 'package:dio/dio.dart';

abstract class ICartDataSource {
  Future<CartModel> getUserCart();
  Future<CartModel> addToCart({required int productId});
  Future<CartModel> removeFromCart({required int productId});
  Future<CartModel> deleteFromCart({required int productId});
  Future<int> cartCountItems();
}

class CartRemoteDataSrc implements ICartDataSource {
  final Dio httpClient;
  static const productIdJsonKey = 'product_id';

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<CartModel> addToCart({required int productId}) async {
    final response = await httpClient.post(
      EndPoints.addToCart,
      data: {productIdJsonKey: productId},
    );
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return CartModel.fromJson(response.data['data']);
  }

  @override
  Future<CartModel> deleteFromCart({required int productId}) async {
    final response = await httpClient.post(
      EndPoints.deleteFromCart,
      data: {productIdJsonKey: productId},
    );
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return CartModel.fromJson(response.data['data']);
  }

  @override
  Future<CartModel> removeFromCart({required int productId}) async {
    final response = await httpClient.post(
      EndPoints.removeFromCart,
      data: {productIdJsonKey: productId},
    );
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return CartModel.fromJson(response.data['data']);
  }

  @override
  Future<CartModel> getUserCart() async {
    final response = await httpClient.post(EndPoints.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return CartModel.fromJson(response.data['data']);
  }

  @override
  Future<int> cartCountItems() async {
    final response = await httpClient.post(EndPoints.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }
}

