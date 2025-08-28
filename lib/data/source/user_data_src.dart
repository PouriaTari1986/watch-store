



import 'package:di_state_managment/data/models/adresses.dart';
import 'package:di_state_managment/data/models/recieve_orders.dart';
import 'package:di_state_managment/data/models/user_info.dart';
import 'package:di_state_managment/data/source/constant.dart';
import 'package:di_state_managment/utils/response_validator.dart';
import 'package:dio/dio.dart';

abstract class IUserDataSrc {

    Future<List<UserInfo>> getUserInfo ();

  Future<List<Addresses>> getUserAddresses ();

  Future<List<RecieveOrders>> getUserRecieveOrders ();

  Future<List<RecieveOrders>> getUserCancelOrders();

  Future<List<RecieveOrders>> getUserProcessingOrders();
  
}
class RemoteDataSrc implements IUserDataSrc{

 final Dio httpClient;

  RemoteDataSrc(this.httpClient);
 
  @override
  Future<List<Addresses>> getUserAddresses()async {
    List<Addresses> address = <Addresses>[];

    final response =await httpClient.post(EndPoints.baseUrl + UserInfoConst.userAddresses);
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for(var element in (response.data['data'])as List){
      address.add(Addresses.fromJson(element));

     
    }
    return address;
  }

  @override
  Future<List<RecieveOrders>> getUserCancelOrders()async {
    List <RecieveOrders> cancleOrders = <RecieveOrders>[];

    final response = await httpClient.post(EndPoints.baseUrl + UserInfoConst.userCncelledOrders);
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for(var element in (response.data['data'])as List){
      cancleOrders.add(RecieveOrders.fromJson(element));
    }
    return cancleOrders;
  }

  @override
  Future<List<UserInfo>> getUserInfo()async {
    List<UserInfo> userInfo = <UserInfo>[];
    final response =await httpClient.post(EndPoints.baseUrl + UserInfoConst.profile);
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for(var element in (response.data['data'])as List){
      userInfo.add(UserInfo.fromJson(element));
    }
    return userInfo;
  }

  @override
  Future<List<RecieveOrders>> getUserProcessingOrders()async {
   
   List<RecieveOrders> processing = <RecieveOrders>[];
    final response = await httpClient.post(EndPoints.baseUrl+ UserInfoConst.userProcessingOrders);
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for(var element in (response.data['data'])as List){
      processing.add(RecieveOrders.fromJson(element));
    }
    return processing;
  }

  @override
  Future<List<RecieveOrders>> getUserRecieveOrders()async {
    List<RecieveOrders> recieve = <RecieveOrders>[];
    final response = await httpClient.post(EndPoints.baseUrl + UserInfoConst.userReceivedOrders);
    HttpResponseValidator.isValidStatusCode(response.statusCode!);
    for(var element in (response.data['data'])as List){
      recieve.add(RecieveOrders.fromJson(element));
    }
    return recieve;
  }

  
}