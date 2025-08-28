import 'package:di_state_managment/data/models/cart_model.dart';
import 'package:di_state_managment/data/source/constant.dart';
import 'package:di_state_managment/utils/response_validator.dart';
import 'package:dio/dio.dart';

abstract class ICartDataSource {
  Future<UserCart> getUserCart();
  Future<UserCart> addToCart({required int productId});
  Future<UserCart> removeFromCart({required int productId});
  Future<UserCart> deleteFromCart({required int productId});
  Future<int> cartCountItems();
 Future<String> payCart();
}


class CartRemoteDataSrc implements ICartDataSource {
  final Dio httpClient;
  static const productIdJsonKey = 'product_id';

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<UserCart> addToCart({required int productId}) async {
    final response = await httpClient.post(
      EndPoints.addToCart,
      data: {productIdJsonKey: productId},
    );
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return UserCart.fromJson(response.data['data']);
  }

  @override
  Future<UserCart> deleteFromCart({required int productId}) async {
    final response = await httpClient.post(
      EndPoints.deleteFromCart,
      data: {productIdJsonKey: productId},
    );
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return UserCart.fromJson(response.data['data']);
  }

  @override
  Future<UserCart> removeFromCart({required int productId}) async {
    final response = await httpClient.post(
      EndPoints.removeFromCart,
      data: {productIdJsonKey: productId},
    );
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return UserCart.fromJson(response.data['data']);
  }

  @override
  Future<UserCart> getUserCart() async {
    final response = await httpClient.post(EndPoints.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return UserCart.fromJson(response.data['data']);
  }

  @override
  Future<int> cartCountItems() async {
    final response = await httpClient.post(EndPoints.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }
  
  @override
  Future<String> payCart()async {
   
   final response = await httpClient.post(EndPoints.payment);
   HttpResponseValidator.isValidStatusCode(response.statusCode??0);
   return response.data['action'];
  }
}

