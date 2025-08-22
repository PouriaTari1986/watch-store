import 'package:bloc/bloc.dart';
import 'package:di_state_managment/data/source/constant.dart';
import 'package:di_state_managment/utils/shared_preferences_manager.dart';
import 'package:di_state_managment/utils/shared_prefrences_const.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial()){
    //check token
    //isStore
    emit(LoggeOutState());
    ////isStore ==false
    ///emit(loggedinState());
  }
  final Dio _dio = Dio();
  void sendSms(String mobile)async{

    emit(LoadingState());
    try {
      await _dio.post(EndPoints.sendSms,data: {"mobile":mobile}).then((value){
        debugPrint(value.toString());
        if(value.statusCode == 201){
          emit(LoadedState(mobile: mobile));
        }else{
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
  void verifyCode(String mobile,String code)async{

    emit(VerifiedState());
    try {
      await _dio.post(EndPoints.checkSmsCode,data: {"mobile":mobile,"code": code}).then((value){
        debugPrint(value.toString());
        if(value.statusCode == 201){
          SharedPreferencesManager().saveString(SharedPrefrencesConst.token, value.data["data"]["token"]);
          


          

          if (value.data["data"]["is_registered"]) {
            emit(VerifiedIsRegisterdeState());
          } else {
            emit(VerifiedIsNotRegisterdeState());
          }
         
        }else{
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }  
  Future<void> registeration()async{}

  void logOut(){}
}
