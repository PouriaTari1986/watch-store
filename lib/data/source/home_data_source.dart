import 'package:di_state_managment/data/models/home.dart';
import 'package:di_state_managment/data/source/constant.dart';
import 'package:di_state_managment/utils/response_validator.dart';
import 'package:dio/dio.dart';

abstract class IHomeDataSource {
  Future<Home> getHome();
}

class HomeRemoteDataSource implements IHomeDataSource {
  final Dio httpClient;

  HomeRemoteDataSource(this.httpClient);
  @override
  Future<Home> getHome() async {
    // ignore: no_leading_underscores_for_local_identifiers
    final Home _home;

    final response = await httpClient.get(EndPoints.home);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    _home = Home.fromJson(response.data['data']);
    return _home;
  }
}
