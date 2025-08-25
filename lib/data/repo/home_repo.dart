import 'package:di_state_managment/data/models/home.dart';
import 'package:di_state_managment/data/source/home_data_source.dart';
import 'package:dio/dio.dart';

abstract class IHomeRepo {
  Future<Home> getHome();
}

class HomeRepository implements IHomeRepo {
  final IHomeDataSource _homeDataSource;

  HomeRepository(this._homeDataSource);

  @override
  Future<Home> getHome() => _homeDataSource.getHome();
}

final homeReopsitory = HomeRepository(HomeRemoteDataSource(Dio()));
