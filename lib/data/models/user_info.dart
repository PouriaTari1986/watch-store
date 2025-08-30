import 'package:di_state_managment/data/models/adresses.dart';

class UserData {
  final UserInfo userInfo;
  final int userProcessingCount;
  final int userReceivedCount;
  final int userCancelCount;

  UserData({
    required this.userInfo,
    required this.userProcessingCount,
    required this.userReceivedCount,
    required this.userCancelCount,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      userInfo: UserInfo.fromJson(json['user_info']),
      userProcessingCount: json['user_processing_count'] ?? 0,
      userReceivedCount: json['user_received_count'] ?? 0,
      userCancelCount: json['user_cancel_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_info': userInfo.toJson(),
      'user_processing_count': userProcessingCount,
      'user_received_count': userReceivedCount,
      'user_cancel_count': userCancelCount,
    };
  }
}

class UserInfo {
  final int id;
  final String? name;
  final String mobile;
  final String? phone;
  List <Addresses> address;

  UserInfo({
    required this.id,
    this.name,
    required this.mobile,
    this.phone,
    required this.address,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      phone: json['phone'],
      address: (json['address'] as List<dynamic>).map((e)=>Addresses.fromJson(e)).toList()
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'phone': phone,
      'address': address,
    };
  }
}
