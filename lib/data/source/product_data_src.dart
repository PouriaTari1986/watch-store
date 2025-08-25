

import 'package:di_state_managment/data/models/product.dart';
import 'package:di_state_managment/data/source/constant.dart';
import 'package:di_state_managment/utils/response_validator.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource{

  Future <List<Product>> getAllByCategory(int id);

  Future <List<Product>> getAllByBrand(int id);

  Future <List<Product>> getSorted(String routeParam);

  Future <List<Product>> searchProduct(String searchKey);

}
class ProductRemoteDataSource implements IProductDataSource{
 final Dio httpClient;

  ProductRemoteDataSource( this.httpClient);


  @override
  Future<List<Product>> getAllByBrand(int id) async {

List<Product> product = <Product>[];
final response =await httpClient.get(EndPoints.productsByBrand+id.toString());

    HttpResponseValidator.isValidStatusCode(response.statusCode??0);
    for (var element in (response.data['all_products']['data']) as List) {
      product.add(Product.fromJson(element));
      
    }
    return product;
  }

  @override
  Future<List<Product>> getAllByCategory(int id) async {
    List<Product> product = <Product>[];
    final response = await httpClient.get(EndPoints.productsByCategory+id.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode??0);
    for(var element in (response.data['all_products']['data'] as List)){
      product.add(Product.fromJson(element));
    }
    return product;
  }

  @override
  Future<List<Product>> getSorted(String routeParam) async {
    List<Product> product = <Product>[];
    final response = await httpClient.get(EndPoints.baseUrl+routeParam);
    HttpResponseValidator.isValidStatusCode(response.statusCode??0);
    for(var element in (response.data['all_products']['data']as List)){
      product.add(Product.fromJson(element));
    }
    return product;
  }

  @override
  Future<List<Product>> searchProduct(String searchKey)async {
    List<Product> product = <Product>[];
    final response = await httpClient.get(EndPoints.search+searchKey);
    HttpResponseValidator.isValidStatusCode(response.statusCode??0);
    for(var element in (response.data['all_products']['data']as List)){
      product.add(Product.fromJson(element));
    }
    return product;
  }
  
}