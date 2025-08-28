

import 'package:di_state_managment/data/models/adresses.dart';
import 'package:di_state_managment/data/models/recieve_orders.dart';
import 'package:di_state_managment/data/models/user_info.dart';

import 'package:di_state_managment/data/source/user_data_src.dart';

abstract class IUserRepo {

  Future<List<UserInfo>> getUserInfo ();

  Future<List<Addresses>> getUserAddresses ();

  Future<List<RecieveOrders>> getUserRecieveOrders ();

  Future<List<RecieveOrders>> getUserCancelOrders();

  Future<List<RecieveOrders>> getUserProcessingOrders();
}

class UserRepository implements IUserRepo{

    final IUserDataSrc _userDataSource;

  UserRepository(this._userDataSource);

  @override
  Future<List<Addresses>> getUserAddresses() {
    return _userDataSource.getUserAddresses();
  }

  @override
  Future<List<RecieveOrders>> getUserCancelOrders()=>_userDataSource.getUserCancelOrders();

  @override
  Future<List<UserInfo>> getUserInfo () => _userDataSource.getUserInfo();

  @override
  Future<List<RecieveOrders>> getUserProcessingOrders() =>_userDataSource.getUserProcessingOrders();

  @override
  Future<List<RecieveOrders>> getUserRecieveOrders()=>_userDataSource.getUserRecieveOrders();
  
}