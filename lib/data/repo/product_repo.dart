import 'package:di_state_managment/data/models/product.dart';
import 'package:di_state_managment/data/source/product_data_src.dart';
import 'package:dio/dio.dart';

abstract class IProductRepo {
  Future<List<Product>> getAllByCategory(int id);

  Future<List<Product>> getAllByBrand(int id);

  Future<List<Product>> getSorted(String routeParam);

  Future<List<Product>> searchProduct(String searchKey);
}

class ProductRepository implements IProductRepo {
  final IProductDataSource _iProductDataSource;

  ProductRepository(this._iProductDataSource);

  @override
  Future<List<Product>> getAllByBrand(int id) =>
      _iProductDataSource.getAllByBrand(id);

  @override
  Future<List<Product>> getAllByCategory(int id) =>
      _iProductDataSource.getAllByCategory(id);

  @override
  Future<List<Product>> getSorted(String routeParam) =>
      _iProductDataSource.getSorted(routeParam);

  @override
  Future<List<Product>> searchProduct(String searchKey) =>
      _iProductDataSource.searchProduct(searchKey);
}

final productRepository = ProductRepository(ProductRemoteDataSource(Dio()));
